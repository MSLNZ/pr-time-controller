"""
Underlying module consisting of all base functions controlling each feature of the hardware design
"""
from pynq import Overlay
from pynq import MMIO
from time import sleep
import logging
from enum import IntEnum
from typing import List
import _thread
TIMER_CLK = 124.688e6 #Window Timer clock
DDS_REF_CLK = 460e6 #DDS Ref clock
DESERIALIZATION_CLOCK = 800e6 #ISERDES high speed clock
SERIALIZATION_FACTOR = 8
DET_REF_CLK = (DESERIALIZATION_CLOCK/SERIALIZATION_FACTOR)*2#Detector ref clock
FIFO_DEPTH = 2048
FTIME = 1/(SERIALIZATION_FACTOR*DET_REF_CLK)#Calculating fine time from serialization factor
axi_base_addr = 0x43c00000 #peripheral base
axi_range = 0x10000
ch1_data = 0x0 #Axi gpio ch1 data address
ch1_dir = 0x4 #Axi gpio ch1 direction address
ch2_data = 0x8 #Axi gpio ch2 data address
ch2_dir = 0xc #Axi gpio ch2 direction address
agpi = 0xFFFFFFFF #Input set
agpo = 0x0 #Output set
slt = 0.2 #Sleep time
#Hardware defs
PHASE_BIT_DEPTH = 48#DDS Compiler's phase bit depth
plog = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s [%(levelname)7s] %(module)s -- %(message)s')

class SP_TOOLS:
    def __init__(self, levelshifter):
        """Initializes the hardware by first loading and configuring the FPGA with the hardware design and then by creating handles for each AXI GPIO block that allows connection from the processing system to the FPGA fabric.
        :param levelshifter: Which level shifter is being used with the pynq, old(0), new(1)
        :type levelshifter: :class:`int`
        """
        #Import FPGA configuration file and download
        if(levelshifter==0):
            self.OV = Overlay("SP_OVERLAY0.bit", 0)
        else:
            self.OV = Overlay("SP_OVERLAY1.bit", 0)
        self.OV.download()
        axi_offset = 0
        ##Initialize Pulse generator
        iDC = 0.5  # Initial duty cycle and frequency
        iFREQ = 440.0
        ph0, ph1 = self.encode_phase_inc(iFREQ)
        iDCenc = self.calc_dc_lim(iFREQ, iDC)
        self.PG_PH = []  # AXI GPIO handles for phase increments for each channel
        self.PG_AUX = []  # AXI GPIO handles for duty cycle(ch1) and delay(ch2) of the GPIO block
        self.chfreqs = [440.0, 440.0, 440.0, 440.0]  # Initial frequency settings of each channel
        self.chdcs = [0.5, 0.5, 0.5, 0.5]  # Initial duty cycles of each channel
        self.chdelays = [0, 0, 0, 0]  # Initial delays of each channel
        for i in range(4):  # Duty length and delay
            tdc = MMIO(axi_base_addr + (axi_offset * axi_range), axi_range)
            tdc.write(ch1_dir, agpo)
            tdc.write(ch1_data, iDCenc)
            tdc.write(ch2_dir, agpo)
            tdc.write(ch2_data, 0x0)
            self.PG_AUX.append(tdc)
            plog.info("DC" + str(i) + " " + hex(axi_base_addr + (axi_offset * axi_range)))
            axi_offset += 1
            self.chdcs[i] = 0.5
        #43c4
        for i in range(4):  # Phase increments
            tap = MMIO(axi_base_addr + (axi_offset * axi_range), axi_range)
            tap.write(ch1_dir, agpo)
            tap.write(ch2_dir, agpo)
            tap.write(ch1_data, ph0)
            tap.write(ch2_data, ph1)
            self.PG_PH.append(tap)
            plog.info("PH" + str(i) + " " + hex(axi_base_addr + (axi_offset * axi_range)))
            axi_offset += 1
            self.chfreqs[i] = 440.0
        #43c8
        self.PG_UTIL = MMIO(axi_base_addr + (axi_offset * axi_range), 0x10000)  # increment load and master reset
        plog.info("PGUTIL: " + hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset += 1
        self.PG_UTIL.write(ch1_dir, agpo)
        self.PG_UTIL.write(ch2_dir, agpo)
        self.PG_UTIL.write(ch1_data, 0x0)  # SEt loader to 0
        self.PG_UTIL.write(ch2_data, 0x0)  # Hold in reset
        # Routine to write initial phase increments
        self.PG_UTIL.write(ch2_data, 0x1)
        self.PG_UTIL.write(ch1_data, 0xF)
        sleep(slt)
        self.PG_UTIL.write(ch1_data, 0x0)
        #43c9
        ##Initialize IDELAY
        self.DELAY_TAPS = MMIO(axi_base_addr + (axi_offset * axi_range), 0x10000)

        plog.info("IDELAY: "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset += 1
        #43ca

        ##Initialize pulse counter
        #Initialize data channels
        self.PC_DAT = []#Holds all the handles for the data GPIO blocks
        #Initialize AXI GPIO modules
        for i in range(4):
            self.PC_DAT.append(MMIO(axi_base_addr + (axi_offset*axi_range),axi_range))
            self.PC_DAT[i].write(ch1_dir,agpi)#ch1 is counts
            self.PC_DAT[i].write(ch2_dir,agpo)#Ch2 is window
            self.PC_DAT[i].write(ch2_data,0xFFFFFFFF)
            plog.info("PCDAT"+str(i)+" -- "+hex(axi_base_addr + (axi_offset*axi_range)))
            axi_offset+=1
        #43ce
        #Initialize utility channels
        self.PC_UTIL = []#Utility GPIO modules (containing reset signal and
        for i in range(4):
            self.PC_UTIL.append(MMIO(axi_base_addr+((axi_offset)*axi_range),axi_range))
            self.PC_UTIL[i].write(ch1_dir,agpo)#Reset
            self.PC_UTIL[i].write(ch1_data,0x0)#Hold in reset
            self.PC_UTIL[i].write(ch2_dir,agpi)#Ready
            plog.info("PCUT"+str(i)+" -- "+hex(axi_base_addr + (axi_offset * axi_range)))
            axi_offset+=1
        #43d2
        #Initialize trigger controller
        self.T_UTIL = MMIO(0x41210000,0x10000)
        self.T_UTIL.write(ch2_dir,0x0)
        self.T_UTIL.write(ch2_data,0x0)
        self.T_RDY_UTIL = MMIO(0x41200000,0x10000)
        self.T_RDY_UTIL.write(ch1_dir,0x1)
        ##Initialize single channel inter-rising_edge detection
        self.ST_FIFO_BUFFER = []
        self.ST_loaded_count = 0
        for i in range(FIFO_DEPTH):
            self.ST_FIFO_BUFFER.append(0)
        self.ST_DATA = MMIO(axi_base_addr + axi_offset*axi_range,axi_range)
        plog.info("STDAT -- "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset+=1
        self.ST_UTIL = MMIO(axi_base_addr + (axi_offset)*axi_range,axi_range)
        self.ST_UTIL.write(ch1_data,0x0)
        plog.info("STUTIL -- "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset+=1
        ##Initialize interchannel coincidence timer
        self.CT_FIFO_BUFFER = []
        self.CT_loaded_count = 0
        for i in range(FIFO_DEPTH):
            self.CT_FIFO_BUFFER.append(0)
        self.CT_DATA = MMIO(axi_base_addr + axi_offset*axi_range,axi_range)
        plog.info("CTDAT -- "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset+=1
        self.CT_UTIL = MMIO(axi_base_addr + (axi_offset)*axi_range,axi_range)
        self.CT_UTIL.write(ch1_data, self.CT_UTIL.read(0x0) & 0b110)
        plog.info("CTUTIL -- " +hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset+=1
        #43d6
        ##Initialize time tagger
        self.TT_FIFO_BUFFER = []
        for i in range(FIFO_DEPTH):
            self.TT_FIFO_BUFFER.append(0)
        self.TT_loaded_count = 0
        self.TT_CONFIG = MMIO(axi_base_addr + (axi_offset*axi_range),axi_range)
        self.TT_CONFIG.write(ch2_data, 0x0)
        plog.info("TT_CONFIG: "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset+=1
        self.TT_DATA0 = MMIO(axi_base_addr + (axi_offset * axi_range), axi_range)
        plog.info("TT_DATA0: "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset += 1
        self.TT_DATA1 = MMIO(axi_base_addr + (axi_offset * axi_range), axi_range)
        plog.info("TT_DATA1: "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset += 1
        self.TT_DELAY_DATA = MMIO(axi_base_addr + (axi_offset * axi_range), axi_range)
        plog.info("TT_DELAY: "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset += 1
        self.TT_UTIL = MMIO(axi_base_addr + (axi_offset * axi_range), axi_range)
        plog.info("TT_UTIL: "+hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset+=1
        self.IDELAY_DEBUG = MMIO(axi_base_addr + (axi_offset * axi_range), axi_range)
        plog.info("IDELAY_DEBUG: " + hex(axi_base_addr + (axi_offset * axi_range)))
        axi_offset+=1
        plog.debug("AXI_RANGE -- "+hex(axi_range))
        #Channel enable controller
        #The enable controller is a tristate controlled buffer which when disabling the output places the channels into
        #a high impedance state allowing other devices connected to the same output to assert control (also to prevent the pynq from blowing up if its connected to something that also outputs signals)
        self.T_UTIL.write(ch1_dir,0x0)
        self.T_UTIL.write(ch1_data,0xF)#SEt all channels to high impedance
        self.pg_ch_stat = 0xF
        sleep(0.05)
        self.IDELAY_DEBUG.write(0x0,0x1)
        #self.PG_UTIL.write(ch2_data,0x0)
        sleep(0.1)
        self.IDELAY_DEBUG.write(0x0,0x1)
        #Initial delay valus
        self.DDs = []
        self.DDs.append(0)
        self.DDs.append(0)
        self.DDs.append(0)
        self.DDs.append(0)
        self.DDs.append(0)
        self.DDs.append(0)
    def restart(self):
        """
        Restarts the overlay and reconfigures the programmable logic.

        """
        self.__init__()
    def pc_set_window(self,window,channels):#Channels is 4 bit integer, window is in seconds
        """Sets the pulse counter counting window period

        :param window: Time to count for (in seconds)
        :param channels: Channels to count on (binary encoded)
        :type window: :class:`float`
        :type channels: :class:`int`



        """
        m = 0B0001

        wval = int(window*TIMER_CLK)
        if(wval > 0xFFFFFFFF or wval <=0):
            plog.error("Window must be between 34.35973836s and 0, cannot be 0 seconds")
            return
        for i in range(4):
            if((0B0001 << i) & channels)!=0:
                self.PC_DAT[i].write(ch2_data,wval)

    def pc_wait_for_rdy(self,channel,mode):
        """Hangs the thread until the counter has data ready to be acquired

        :param channel: Channel to wait for
        :param mode: Mode of operation, 0 for fixed window mode, or 1 for external stop trigger mode
        :type channel: :class:`int`
        :type mode: :class:`int`



        """
        if mode == 0:#If when the counter stops is defined by time window
            if (self.PC_UTIL[channel].read(ch2_data) == 0):
                while (self.PC_UTIL[channel].read(ch2_data) == 0):
                    pass
            else:
                while (self.PC_UTIL[channel].read(ch2_data) == 1):
                    pass
        else:#If when the counter stops is defined by an external stop signal
            if(self.T_RDY_UTIL.read(ch1_data)==0):
                while(self.T_RDY_UTIL.read(ch1_data)==0):
                    pass

    def pc_ex_triggered(self,window):
        """Start counting function for externally supplied start signal

        :param window: Counting window (in seconds)
        :type window: :class:`int`

        :return: List of counts for each channel
        :rtype: class:`list` of `int`


        """
        #Set the window of all channels to specified window value and start the counter
        self.pc_set_window(window,0xF)
        self.T_UTIL.write(ch2_data,0x1)#Set the external trigger block to activate the counter once trigger pulse occurs
        #Wait till the counter finishes counting
        self.pc_wait_for_rdy(0,0)
        retval = []
        for i in range(4):
            retval.append(self.pc_read_counts(i))#Append each channels counts to output array
        self.T_UTIL.write(ch2_data,0x0)
        return retval
    def pc_ex_trig_stop(self):
        """Enables and waits for the pulse counter to stop counting (based off when the stop signal is pulsed) and returns the counts for each channel.

        :return: Array of counts for each channel
        :rtype: :class:`list` of `int`

        """
        # Set the trigger controller to start the counter when the start trigger is acquired
        # and stop the counter when the stop signal is acquired

        self.T_UTIL.write(ch2_data,0x3)
        #Set the window for all channels to maximum (as window is unknown in this mode and externally defined)
        for i in range(4):
            self.PC_DAT[i].write(ch2_data,0xFFFFFFFF)
        #Wait until the stop trigger is acquired
        self.pc_wait_for_rdy(0,1)
        retval = []
        #Read, store and return all count values as an array
        for i in range(4):
            retval.append(self.pc_read_counts(i))
        self.T_UTIL.write(ch2_data,0x0)
        return retval
    def pc_enable_channels(self,channels):#channels a 4 bit integer
        """Enable counting on supplied channels

        :param channels: Channels to enable counting on (binary encoded)
        :type channels: :class:`int`

        """
        #Enable any channel that is indicated by a 1 in the 4 bit integer
        for i in range(4):
            if((0B0001 << i) & channels)!= 0:
                self.PC_UTIL[i].write(ch1_data,0x1)

    def pc_disable_channels(self,channels):#Channels a 4 bit integer
        """Disable counting on supplied channels

        :param channels: Channels to disable counting on (binary encoded)
        :type channels: :class:`int`

        """
        #Disable any channel that is indicated by a 1 in the 4 bit integer
        for i in range(4):
            if((0B0001 << i) & channels)!= 0:
                self.PC_UTIL[i].write(ch1_data,0x0)

    def pc_read_counts(self,channel):
        """Read counts on channel specified

        :param channel: Channel to read counts of (0-3)
        :type channel: :class:`int`

        :return: Number of counts
        :rtype: :class:`int`

        """
        return self.PC_DAT[channel].read(ch1_data)
    ####----------------------------------------------------------------------------------####
    ####------------------Single line inter-rising_edge timer-----------------------------####
    def st_read_coarse(self):
        """Reads coarse timer counter value

        :return: Interdetection time in counter clock cycles
        :rtype: :class:`int`

        """
        return self.ST_DATA.read(0x0)

    def st_read_fine(self):
        """Reads the fine time offsets from the rising edge of the coarse clock.

        :return: Fine time offsets
        :rtype: :class:`int`
        """
        return self.ST_DATA.read(0x8)

    def st_read_drdy(self):
        """Reads whether data is valid to be read

        :return: Value of the valid line (0 or 1)
        :rtype: :class:`int`

        """
        return self.ST_UTIL.read(0x8) & 0b1

    def st_read_empty(self):
        """Reads whether the FIFO is empty

        :return: 0 or 1 for not empty and empty respectively
        :rtype: :class:`int`

        """
        return (self.ST_UTIL.read(0x8) & 0b10) >> 1

    def st_read_full(self):
        """Reads whether the FIFO is full

        :return: 0 or 1 for not full and full respectively
        :rtype: :class:`int`

        """
        return (self.ST_UTIL.read(0x8) & 0b100) >> 1

    def st_set_mreset(self, val):
        """
        Sets the master reset of the module (active low), when in reset the module is disabled

        :param val: Value of the reset line (0 or 1)
        :type val: :class:`int`

        """
        lastval = self.ST_UTIL.read(0x0) & 0b110
        self.ST_UTIL.write(0x0, lastval | (val & 0b1))

    def st_set_req(self, val):
        """
        Sets the data request line to indicate to the FIFO read controller to clock a single data point out of the FIFO (ACTIVE HIGH)

        :param val: Value of the request line (0 or 1)
        :type param: :class:`int`

        """
        lastval = self.ST_UTIL.read(0x0) & 0b101
        self.ST_UTIL.write(0x0, lastval | ((val << 1) & 0b10))

    def st_set_dreset(self, val):
        """
        SEts the FIFO read controller's reset, to reset it back to awaiting a request signal (active low)

        :param val: Value of the reset line (0 or 1)
        :type val: :class:`int`


        """
        lastval = self.ST_UTIL.read(0x0) & 0b011
        self.ST_UTIL.write(0x0, lastval | ((val << 2) & 0b100))
    def st_start(self):
        """
        Starts the single channel inter rising edge timer module

        """
        self.st_set_mreset(1)
    def st_stop(self):
        """
        Stops the inter rising edge timer module

        """
        self.st_set_mreset(0)
        self.st_set_dreset(0)
    def st_flush_buffer(self):
        """
        HELPER - NOT USED CURRENTLY - Flushes the local FIFO buffer (NOT THE HARDWARE FIFO, TO Do THAT CAL st_read2048() AND THEN FLUSH)

        """
        for i in range(FIFO_DEPTH):
            self.ST_FIFO_BUFFER[i]=0
        self.ST_loaded_count=0
    def st_proc(self):
        """
        Reads 2048 values from the FIFO (or until empty) and places the data into a dictionary with length and module ID ready to be sent over socket.

        :return: Dictionary containing module identification, length of data list, and the data list
        :rtype: :class:`dict`

        """
        self.st_read2048()
        return {"MOD":"ST","LEN":self.ST_loaded_count,"DAT":self.ST_FIFO_BUFFER}
    def st_read2048(self):
        """
        Reads data from the FIFO until empty and stores each recovered data point in the local FIFO buffer.

        """
        if(self.st_read_empty()==1):
            plog.warning("FIFO EMPTY")
            self.ST_loaded_count=0
            return
        for i in range(FIFO_DEPTH):
            if(self.st_read_empty()==1):
                self.ST_loaded_count=i
                return
            self.st_set_dreset(1)#Pull FIFO read controller out of reset and request data
            self.st_set_req(1)
            while(self.st_read_drdy()==0):
                pass
            self.ST_FIFO_BUFFER[i]=self.st_read_coarse() | self.st_read_fine() << 32#Concatenate both fine and coarse times and store the resulting value into the local buffer
            #print(self.loaded_data[i]&0xFFFFFFFF)
            self.st_set_req(0)#Deassert the request line and reset the read controller
            self.st_set_dreset(0)
        self.ST_loaded_count=FIFO_DEPTH

    ####----------------------------------------------------------------------------------####
    ####------------------Two channel photon coincidence timer----------------------------####
    def ct_start(self,mode):
        """
        Starts the two channel coincidence timer

        :param mode: Line select mode, whether to treat the first channel as start or second, or whichever is detected first (0,1,2)
        :type mode: :class:`int`

        """
        if(mode!= 2):
            self.ct_set_fsel(mode)
            self.ct_set_bidir(0)
        else:
            self.ct_set_bidir(1)
        self.ct_set_mreset(1)
    def ct_stop(self):
        """
        Stops the two channel coincidence timer

        """
        self.ct_set_mreset(0)
    def ct_flush_buffer(self):
        """
        HELPER - NOT USED CURRENTLY - Flushes the local FIFO buffer (NOT THE HARDWARE FIFO, TO Do THAT CAL ct_read2048() AND THEN FLUSH)

        """
        for i in range(FIFO_DEPTH):
            self.CT_FIFO_BUFFER[i]=0
        self.loaded_count=0
    def ct_proc(self):
        """
        Reads 2048 values from the FIFO (or until empty) and places the data into a dictionary with length and module ID ready to be sent over socket.


        :return: Dictionary containing module identification, length of data list, and the data list
        :rtype: :class:`dict`


        """
        self.ct_read2048()
        return {"MOD":"CT","LEN":self.loaded_count,"DAT":self.CT_FIFO_BUFFER}
    def ct_read2048(self):
        """
        Reads data from the FIFO until empty and stores each recovered data point in the local FIFO buffer.

        """
        if(self.ct_read_empty()==1):
            plog.warning("FIFO EMPTY")
            self.CT_loaded_count=0
            return
        for i in range(FIFO_DEPTH):
            if(self.ct_read_empty()==1):
                self.loaded_count=i
                return
            self.ct_set_dreset(1)
            self.ct_set_req(1)
            while(self.ct_read_drdy()==0):
                pass
            self.CT_FIFO_BUFFER[i]=self.ct_read_coarse() | self.ct_read_fine() << 32
            #print(self.loaded_data[i]&0xFFFFFFFF)
            self.ct_set_req(0)
            self.ct_set_dreset(0)
        self.loaded_count=FIFO_DEPTH
    def ct_read_coarse(self):
        """Reads coarse timer counter value

        :return: Interdetection time in counter clock cycles
        :rtype: :class:`int`

        """
        return self.CT_DATA.read(0x0)
    def ct_read_fine(self):
        """Reads the fine time offsets from the rising edge of the coarse clock.

        :return: Fine time offsets
        :rtype: :class:`int`
        """
        return self.CT_DATA.read(0x8)
    def ct_set_fsel(self,val):
        """
        Sets the first detection channel select line.

        :param val: 0 to treat Ch1 as start signal, 1 to treat CH2 as start signal
        :type val: :class:`int`


        """
        lastval = self.CT_UTIL.read(0x0) & 0b11101
        self.CT_UTIL.write(0x0,lastval | ((val<<1)&0b10))
    def ct_set_bidir(self,val):
        """
        Sets whether the module chooses the start signal based on which channel is detected first (ACTIVE HIGH), if set, the setting of ct_set_fsel() is ignored.

        :param val: 0 or 1 to give precendence to fsel line or to pick based off which comes first respectively.
        :type val: :class:`int`



        """
        lastval = self.CT_UTIL.read(0x0) & 0b11011
        self.CT_UTIL.write(0x0,lastval | ((val<<2)&0b100))
    def ct_read_drdy(self):
        """
        Reads whether data is valid to be read

        :return: Value of the valid line (0 or 1)
        :rtype: :class:`int`


        """
        return self.CT_UTIL.read(0x8) & 0b1
    def ct_read_empty(self):
        """Reads whether the FIFO is empty

        :return: 0 or 1 for not empty and empty respectively
        :rtype: :class:`int`

        """
        return (self.CT_UTIL.read(0x8) & 0b10)>>1
    def ct_read_full(self):
        """Reads whether the FIFO is full

        :return: 0 or 1 for not full and full respectively
        :rtype: :class:`int`

        """
        return (self.CT_UTIL.read(0x8) & 0b100)>>1
    def ct_set_mreset(self,val):
        """
        Sets the master reset of the module (active low), when in reset the module is disabled

        :param val: Value of the reset line (0 or 1)
        :type val: :class:`int`

        """
        lastval = self.CT_UTIL.read(0x0) & 0b11110
        self.CT_UTIL.write(0x0,lastval | (val&0b1))
    def ct_set_req(self,val):
        """
        Sets the data request line to indicate to the FIFO read controller to clock a single data point out of the FIFO (ACTIVE HIGH)

        :param val: Value of the request line (0 or 1)
        :type param: :class:`int`

        """
        lastval = self.CT_UTIL.read(0x0) & 0b01111
        self.CT_UTIL.write(0x0, lastval | ((val<<4) & 0b10000))
    def ct_set_dreset(self,val):
        """
        SEts the FIFO read controller's reset, to reset it back to awaiting a request signal (active low)

        :param val: Value of the reset line (0 or 1)
        :type val: :class:`int`


        """
        lastval = self.CT_UTIL.read(0x0) & 0b10111
        self.CT_UTIL.write(0x0, lastval | ((val<<3) & 0b1000))
    ####---------------------Signal generator---------------------------------------------####

    def pg_disable(self):
        """Disable signal generator, holds the submodule in reset bringing all outputs low


        """
        self.PG_UTIL.write(ch2_data,0x0)
    def pg_enable(self):
        """Enables the signal generator, takes hardware submodule out of reset


        """
        self.PG_UTIL.write(ch2_data,0x1)
    def pg_enable_channel(self,channel):
        """Enable specified channel, takes channel out of tristate high Z mode

        :param channel: Channel to enable (0-3)
        :type channel: :class:`int`

        """
        #As the enable lines are active low, must set the channel specified's place from a 1 to a 0.
        self.pg_ch_stat = ~(~self.pg_ch_stat | (0B0001 << channel))
        self.T_UTIL.write(ch1_data,self.pg_ch_stat)
    def pg_disable_channel(self,channel):
        """Disable specified channel, places channel into tristate high Z mode

        :param channel: Channel to disable (0-3)
        :type channel: :class:`int`

        """
        self.pg_ch_stat = self.pg_ch_stat | (0b0001 << channel)
        self.T_UTIL.write(ch1_data, self.pg_ch_stat)
    def pg_set_channel_freq(self,channel,freq):
        """Sets the frequency of the specified channel

        :param channel: Channel to set frequency of (0-3)
        :param freq: Frequency to set channel to (in Hz)
        :type channel: :class:`int`
        :type freq: :class:`float`

        """
        nenc = self.encode_phase_inc(2*freq)#Calculate the phase increment value required by the DDS Compiler
        self.PG_PH[channel].write(ch1_data,nenc[0])#Write LSB(31 downto 0) of total 48 bits to the DDS
        self.PG_PH[channel].write(ch2_data, nenc[1])#Write MSB(47 downto 32) of 48 bits to the DDS
        self.PG_UTIL.write(ch1_data,0xF)#Enable loading of phase increments to the DDS Compiler
        sleep(slt)
        self.PG_UTIL.write(ch1_data,0x0)
        #Calculate duty cycle counter limit
        newdc = self.calc_dc_lim(freq,self.chdcs[channel])
        self.PG_UTIL.write(ch2_data,0x0)#Disable signal generator
        #Write new settings to the hardware
        self.PG_AUX[channel].write(ch1_data,newdc)
        self.PG_AUX[channel].write(ch2_data,self.calc_delay(self.chdelays[channel]))
        self.PG_UTIL.write(ch2_data,0x1)#Re-enable signal generator
        self.chfreqs[channel]=freq#Synchronzie the host setting of the frequency to the frequency setting on the hardware
    def pg_set_dc(self,channel,dc):#Dc from 0 to 1
        """Sets the duty cycle of the specified channel

        :param channel: Channel to set the duty cycle of (0-3)
        :param dc: Duty cycle to set the specified channel to (0-1)
        :type channel: :class:`int`
        :type dc: :class:`float`

        """
        #Calculate the duty cycle counter limit from new duty cycle value
        dcenc = self.calc_dc_lim(self.chfreqs[channel],dc)
        self.PG_UTIL.write(ch2_data,0x0)#dsaible signal generator
        self.PG_AUX[channel].write(ch1_data,dcenc)#WRite new duty cycle counter value
        self.PG_UTIL.write(ch2_data,0x1)#Re-enable
        self.chdcs[channel]=dc#Sync the host setting of the duty cycle to the duty cycyel setting on hardware
    def pg_set_pw(self,channel,pw):
        """Sets the pulse width of the channel specified

        :param channel: Channel to set pulse width of (0-3)
        :param pw: Pulse width to set channel to (in milliseconds)
        :type channel: :class:`int`
        :type pw: :class:`float`

        """
        pwv = self.calc_delay(pw/1000)#Calculating duty cycle counter value from time
        self.PG_UTIL.write(ch2_data,0x0)#Disable signal generator
        self.PG_AUX[channel].write(ch1_data,pwv)#Write the new duty cycle counter value to the hardware
        self.PG_UTIL.write(ch2_data,0x1)#Re-enable signal generator
        #Calculate what the new duty cycle of the signal is in 0-1 rather than pulse width and save that as the host setting
        tlim = DDS_REF_CLK/self.chfreqs[channel]
        self.chdcs[channel]=pwv/tlim
    def pg_set_delay(self,channel,delay):#Delay in seconds
        """Sets the delay of the specified channel

        :param channel: Channel to set delay of (0-3)
        :param delay: The delay the specified channel is to be set to(in seconds)
        :type channel: :class:`int`
        :type delay: :class:`float`


        """
        delv = self.calc_delay(delay)#Calculate the counter value the delay counter must count upto before enabling the channel
        self.PG_UTIL.write(ch2_data,0x0)#Disable the signal generator, write the delay value to the delay controller
        self.PG_AUX[channel].write(ch2_data,delv)
        self.chdelays[channel]=delay#Save the delay setting
        self.PG_UTIL.write(ch2_data,0x1)#Restart the signal generator
    def encode_phase_inc(self,freq):
        """Converts a supplied frequency to a phase increment amount that is supplied to the DDS modules to produce the necessary sine wave.
        Internally used function, should not be called directly.

        :param freq: Frequency in Hz
        :type freq: :class:`float`

        :return: 48 bit phase increment, first element is 32 bit LSB, second element is 16 bit MSB
        :rtype: :class:`list` of :class:`float`

        """
        enc = int((freq*2**PHASE_BIT_DEPTH)/DDS_REF_CLK)#Calculate the phase increment of the DDS to produce the required frequency
        #Split the 48 bit number into 32 and 16 bits
        lsb = enc & 0xFFFFFFFF
        msb = (enc >> 32) & 0xFFFF
        return [lsb,msb]
    def calc_dc_lim(self,freq,dc): #dc from 0 to 1
        """Calculates the count value of the hardware counter where the output changes from high to low after this count value is passed by the hardware counter

        :param freq: Frequency of the signal currently being emitted.
        :param dc: Duty cycle value (0-1)
        :type freq: :class:`float`
        :type dc: :class:`float`

        :return: Count value the hardware counter counts up to before switching the output signal from high to low.
        :rtype: :class:`int`

        """
        dc_t = int(DDS_REF_CLK/freq)
        return int(dc_t*dc)
    def calc_delay(self,delay):
        """Calculates the delay timer count value from a time in seconds

        :param delay: Delay time in seconds
        :type delay: :class:`float`

        :return: Count limit for delay timer
        :rtype: :class:`int`

        """
        return int(delay*DDS_REF_CLK)
    #TIME TAGGER FUNCTIONS-----------------------------------------------
    def tt_start(self,timeout):
        """
        Starts the time tagger module

        :param timeout: Number of counter cycles to wait for.
        :type timeout: :class:`int`


        """
        self.tt_set_timeout(timeout)
        self.tt_set_mreset(1)
    def tt_stop(self):
        """
        Stops the time tagger

        """
        self.tt_set_mreset(0)
    def tt_flush_buffer(self):
        """
        HELPER - NOT USED CURRENTLY - Flushes the local FIFO buffer (NOT THE HARDWARE FIFO, TO Do THAT CAL tt_read2048() AND THEN FLUSH)

        """
        for i in range(FIFO_DEPTH):
            self.TT_FIFO_BUFFER[i]=0
        self.TT_loaded_count=0
    def tt_proc(self):
        """
        Reads 2048 values from the FIFO (or until empty) and places the data into a dictionary with length and module ID ready to be sent over socket.


        :return: Dictionary containing module identification, length of data list, and the data list
        :rtype: :class:`dict`


        """
        self.tt_read2048()
        data = {"MOD":"TT","LEN":self.TT_loaded_count,"DAT":self.TT_FIFO_BUFFER}
        return data
    def tt_read2048(self):
        """
        Reads data from the FIFO until empty and stores each recovered data point in the local FIFO buffer.

        """
        if(self.tt_read_empty()==1):
            plog.warning("FIFO EMPTY")
            self.TT_loaded_count=0
            return
        for i in range(FIFO_DEPTH):
            if(self.tt_read_empty()==1):
                self.TT_loaded_count=i
                return
            self.tt_set_dreset(1)
            self.tt_set_req(1)
            while(self.tt_read_drdy()==0):
                pass
            #Concatenate each part of current run (Coarse and fine times for each channel and time outs) into a singular integer and place in local buffer
            self.TT_FIFO_BUFFER[i]=((self.tt_read_coarse() | self.tt_read_fine() << 128 | self.tt_read_timeouts() << 168))
            self.tt_set_req(0)
            self.tt_set_dreset(0)
        self.TT_loaded_count=FIFO_DEPTH
    def tt_read_coarse(self):
        """Reads coarse timer counter value

        :return: Interdetection time in counter clock cycles
        :rtype: :class:`int`

        """
        d0 = self.TT_DATA0.read(0x0)
        d1 = self.TT_DATA0.read(0x8)<<32
        d2 = self.TT_DATA1.read(0x0)<<64
        d3 = self.TT_DATA1.read(0x8)<<96
        return d0 | d1 | d2 | d3
    def tt_read_fine(self):
        """Reads the fine time offsets from the rising edge of the coarse clock.

        :return: Fine time offsets
        :rtype: :class:`int`
        """
        return self.TT_DELAY_DATA.read(0x0) | (self.TT_DELAY_DATA.read(0x8)&0xFF)<<32

    def tt_read_drdy(self):
        """
        Reads whether data is valid to be read

        :return: Value of the valid line (0 or 1)
        :rtype: :class:`int`

        """
        return (self.TT_UTIL.read(0x8) & 0b100)>>2
    def tt_read_empty(self):
        """Reads whether the FIFO is empty

        :return: 0 or 1 for not empty and empty respectively
        :rtype: :class:`int`

        """
        return (self.TT_UTIL.read(0x8) & 0b1)
    def tt_read_full(self):
        """Reads whether the FIFO is full

        :return: 0 or 1 for not full and full respectively
        :rtype: :class:`int`

        """
        return (self.TT_UTIL.read(0x8) & 0b10)>>1
    def tt_set_mreset(self,val):
        """
        Sets the master reset of the module (active low), when in reset the module is disabled

        :param val: Value of the reset line (0 or 1)
        :type val: :class:`int`

        """
        lastval = self.TT_CONFIG.read(0x8) & 0b110
        self.TT_CONFIG.write(0x8,lastval | (val&0b1))
    def tt_set_req(self,val):
        """
        Sets the data request line to indicate to the FIFO read controller to clock a single data point out of the FIFO (ACTIVE HIGH)

        :param val: Value of the request line (0 or 1)
        :type param: :class:`int`

        """
        lastval = self.TT_CONFIG.read(0x8) & 0b101
        self.TT_CONFIG.write(0x8, lastval | ((val<<1) & 0b10))
    def tt_set_dreset(self,val):
        """
        SEts the FIFO read controller's reset, to reset it back to awaiting a request signal (active low)

        :param val: Value of the reset line (0 or 1)
        :type val: :class:`int`


        """
        lastval = self.TT_CONFIG.read(0x8) & 0b011
        self.TT_CONFIG.write(0x8, lastval | ((val<<2) & 0b100))
    def tt_set_timeout(self,val):
        """
        Sets the time out data bus for the time tagger

        :param val: 32 bit integer stating the time out in TDC_REF_CLK cycles
        :type val: :class:`int`

        """
        self.TT_CONFIG.write(0x0,val&0xFFFFFFFF)
    def tt_read_timeouts(self):
        """
        Reads the channel time out statuses

        :return: 4 bit binary encoded integer showing the time out state for each line (0 if the channel timed out)
        :rtype: :class:`int`

        """
        return self.TT_UTIL.read(0x0)
    #TIME_TAGGER_END-----------------------------------------------------

    def DD_idelay(self,channel,tap0,tap1):
        """Sets the input delay of the specified channel by configuring the delay line taps and the number of delay line stages to include
           Channels 4 and 5 are T0 and END TRIG

        :param channel: Channel to delay (0-5)
        :param tap0: Delay line tap (0-31)
        :param tap1: Delay line cascaded tap (0-31)
        :type channel: :class:`int`
        :type tap0: :class:`int`
        :type tap1: :class:`int`

        """

        concattaps = tap0 | (tap1 << 5)
        self.DDs[channel] = concattaps
        allconcat0 = self.DDs[4] | (self.DDs[0] << 10) | (self.DDs[1] << 20)
        allconcat1 = self.DDs[2] | (self.DDs[3] << 10) | (self.DDs[5] << 20)
        self.DELAY_TAPS.write(0x0,allconcat0)
        self.DELAY_TAPS.write(0x8, allconcat1)
        plog.info("Setting input delay on channel "+str(channel)+" dline taps T0:"+str(tap0)+" T1:"+str(tap1))
        self.IDELAY_DEBUG.write(0x8,0b1)
        sleep(0.1)
        self.IDELAY_DEBUG.write(0x8,0b0)
        self.IDELAY_DEBUG.write(0x0,0x1)
        sleep(0.05)
        plog.debug("OBS0: "+bin(self.IDELAY_DEBUG.read(0x0)))

    def uencode(self,val,length):
        """[DEPRECIATED] - NOT USED - Calculates the number of binary ones in an integer of specified length

        :param val: Arbitrary integer to get the number of binary ones from
        :param length: Length of the binary integer to include when counting up the ones.
        :type val: :class:`int`
        :type length: :class:`int`


        :return: The total number of ones within the binary length specified in the specified integer
        :rtype: :class:`int`

        """
        cnt = 0
        for i in range(length):#Just counts how many ones in binary there are in the range specified by length
            if((val>>i)&0b1 == 1):
                cnt+=1
        return cnt


class LineSelectMode(IntEnum):
    L1FIRST = 0
    L2FIRST = 1
    DONTCARE = 2
