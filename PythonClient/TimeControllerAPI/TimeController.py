import socket
from multiprocessing import Process,Lock
import json
from enum import IntEnum
from time import sleep
HOST = '169.254.0.2'
PORT = 6050
DELAY_TAP_RESOLUTION = 78e-12
TDC_REF_CLK = 200e6
TDC_SFACTOR = 8
TDC_FTIME = 1/(TDC_REF_CLK*TDC_SFACTOR)
import logging
class TimeController:
    """
    Main class for all the Time Controller API
    """
    def __init__(self,host,port,mode,lvlshiftermode=0):
        """

        :param host: Host address
        :param port: Port host is listening on
        :param mode: Default tool suite or high resolution mode
        :param lvlshiftermode: Defines whether to use the old level shifter boards (0) or new ones (1)
        :type lvlshiftermode: :class:`int`
        :type host: :class:`str`
        :type port: :class:`int`
        :type mode: :class:`int`

        """
        HOST = host
        PORT = port
        self.logger = logging.getLogger(__name__)

        try:
            self.MODE = mode
            self.websocket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
            self.websocket.connect((HOST,PORT))
            self.websocket.sendall(("START"+str(int(mode))+str(lvlshiftermode)).encode())
            data = self.websocket.recv(1024).decode()
            if(data=="DONE"):
                self.logger.info("Connection succeeded")
                self.connected = 1
            else:
                raise Exception("Failed to configure hardware")
        except Exception as e:
            self.logger.error("Connection failed: "+str(e.args))
            self.connected=0

    def reconnect(self,host,port,mode,lvlshiftermode=0):
        """
        Reconnect to the device

        :param host: Host address
        :param port: Port host is listening on
        :param mode: Default tool suite or high resolution mode\
        :param lvlshiftermode: Defines whether to use the old level shifter boards (0) or new ones (1)
        :type lvlshiftermode: :class:`int`
        :type host: :class:`str`
        :type port: :class:`int`
        :type mode: :class:`int`

        """
        HOST = host
        PORT = port
        try:
            self.MODE = mode
            self.websocket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
            self.websocket.connect((HOST,PORT))
            self.websocket.sendall(("START"+str(int(mode))+str(lvlshiftermode)).encode())
            data = self.websocket.recv(1024).decode()
            if(data=="DONE"):
                self.logger.info("Connection succeeded")
                self.connected = 1
            else:
                raise Exception("Failed to configure hardware")
        except Exception as e:
            self.logger.error("Connection failed: "+str(e.args))
            self.connected=0

    def run_pulse_counter(self,window,mode):
        """
        Runs the pulse counter function of the time controller

        :param window: Time window to count for
        :param mode: Triggering mode of type CounterMode
        :type window: :class:`float`
        :type mode: :class:`int`

        :return: List of counts on each channel
        :rtype: :class: `list` of `int`

        """
        if(self.connected==0):
            self.logger.error("Not connected")
            return 0
        if(self.MODE!=0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.logger.info("Running pulse counter. Mode: "+str(int(mode))+" Window: "+str(window))
        self.websocket.sendall(("PC"+str(int(mode))+str(window)).encode())
        while 1:
            data = self.websocket.recv(1024).decode()
            if(data[:2]=="PC"):
                break
            else:
                self.logger.warning("Data not pertinent to pulse counter received "+data)
        counts = json.loads(data[2:])
        self.logger.info("Returned counts: "+str(counts))
        return counts

    def start_iretimer(self):
        """
        Run the single channel inter-rising_edge timer

        :return: Time between rising edges
        :rtype: :class:`float`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.logger.info("Starting single line inter rising edge timer")
        self.websocket.sendall("STS".encode())
    def iretimer_conv_to_time(self,data):
        """
        Converts the raw data from the IRETimer module into actual times in seconds

        :param data: Recieved dictionary containing data and meta information (length and what module it pertains to)
        :type data: :class:`dict`

        :return: List of times in seconds
        :rtype: :class:`list` of `float`

        """
        outputdata = []
        iterabledata = data["DAT"]
        for i in range(data["LEN"]):
            coarse = iterabledata[i] & 0xFFFFFFFF
            finetime = (iterabledata[i] & 0xFFFF00000000)>>32
            ctime = coarse/TDC_REF_CLK
            pretime = (finetime & 0xFF)*TDC_FTIME
            posttime = ((finetime & 0xFF00)>>8)*TDC_FTIME
            outputdata.append(ctime+pretime-posttime)
        return outputdata
    def acquire_iretimer_data(self):
        """
        Acquires latest set of 2048 data points from the timer

        :return: 2048 times between rising edges, or as many as the FIFO buffer had inside
        :rtype: :class:`list` of `float`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.logger.info("Acquiring data from single line inter rising edge timer")
        sdata = ""
        self.websocket.sendall("STA".encode())
        while True:#Loop until all data from the socket has been acquired
            dat = self.websocket.recv(8172).decode()

            if (dat[-3:] == "STX"):#If the termination signal has been found, stop the loop, no more data to be read
                self.logger.debug("HALTING READ")
                sdata = sdata + dat[:-3]
                break
            else:
                sdata = sdata + dat
        data = json.loads(sdata)
        return self.iretimer_conv_to_time(data)
    def stop_iretimer(self):
        """
        Stop the single channel inter-rising_edge timer

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.logger.info("Stopping single line inter rising edge timer")
        self.websocket.sendall("STX".encode())

    def start_coincidence_timer(self,lineselect):
        """
        Stats the coincidence timer's data acquisiton

        :param lineselect: Decides which line to treat as the start signal or whether just to pick the first detected line as a start signal.
        :type lineselect: :class:`int`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.logger.info("Starting two channel coincidence timer")
        self.websocket.sendall(("CTS"+str(int(lineselect))).encode())
    def stop_coincidence_timer(self):
        """
        Stops the coincidence timer's data acquisition

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.logger.info("Stopping two channel coincidence timer")
        self.websocket.sendall("CTX".encode())
    def acquire_coincidence_timer_data(self):
        """
        Request acquired data points from the FIFO of the coincidence timer module (up to 2048 points)

        :return: Acquired times in seconds
        :rtype: :class:`list` of `float`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.logger.info("Acquiring data from coincidence timer")
        sdata = ""
        self.websocket.sendall("CTA".encode())
        while True:#Loop until all data from the socket has been acquired
            dat = self.websocket.recv(8172).decode()

            if (dat[-3:] == "CTX"):#On detecting data termination, break the loop
                self.logger.debug("HALTING READ")
                sdata = sdata + dat[:-3]
                break
            else:
                sdata = sdata + dat
        data = json.loads(sdata)
        return self.iretimer_conv_to_time(data)
    def start_time_tagger(self,timeout):
        """
        Starts the time tagger module's passive data acquisition.

        :param timeout: Time out for detection of channels in seconds
        :type timeout: :class:`float`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        cycles = int(timeout*TDC_REF_CLK)
        self.logger.info("Starting time tagger")
        self.websocket.sendall(("TTS"+str(cycles)).encode())
    def stop_time_tagger(self):
        """
        Stops the time tagger's passive data acquisition.

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.logger.info("Stopping time tagger")
        self.websocket.sendall("TTX".encode())
    def acquire_time_tagger_data(self):
        """
        Request acquired data from the time tagger module, will acquire all available data upto 2048 points from the module.

        :return: Dictionary containing tagged times for each channel along with time out states for each channel
        :rtype: :class:`dict`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        self.websocket.sendall("TTA".encode())
        sdata = ""
        while True:#Loop until all data from the socket has been acquired
            dat = self.websocket.recv(8172).decode()

            if(dat[-3:]=="TTX"):#If the termination signal has been found, break the loop
                self.logger.debug("HALTING READ")
                sdata = sdata+dat[:-3]
                break
            else:
                sdata=sdata+dat
        data = json.loads(sdata)
        time_data = self.time_tagger_conv_to_time(data)
        return time_data

    def time_tagger_conv_to_time(self, data):
        """
        Converts raw data from the socket to individual times in seconds.

        :param data: Dictionary containing module identification, data length and list of raw data.
        :type data: :class:`dict`

        :return: Dictionary containing tagged times for each channel along with time out states for each channel
        :rtype: :class:`dict`

        """
        outputdata = {"T1": [], "T2": [], "T3": [], "T4": [], "TM": []}
        iterabledata = data["DAT"]
        for i in range(data["LEN"]):
            deconcat = self.time_tagger_break_data(iterabledata[i])#Break up the data into individual channel data.
            #Calculate the times
            outputdata["T1"].append(deconcat[0] / TDC_REF_CLK + (deconcat[4] - deconcat[5]) * TDC_FTIME)
            outputdata["T2"].append(deconcat[1] / TDC_REF_CLK + (deconcat[4] - deconcat[6]) * TDC_FTIME)
            outputdata["T3"].append(deconcat[2] / TDC_REF_CLK + (deconcat[4] - deconcat[7]) * TDC_FTIME)
            outputdata["T4"].append(deconcat[3] / TDC_REF_CLK + (deconcat[4] - deconcat[8]) * TDC_FTIME)
            outputdata["TM"].append(deconcat[9])
        return outputdata

    def time_tagger_break_data(self, data):
        """
        Breaks up the raw binary data points sent into each numerical quantity

        :param data: Raw binary integer 172 bits wide containing all data concatenated together
        :type data: :class:`int`

        :return: Time tagger raw cycle times, fine times and time out states
        :rtype: :class:`list` of `int`

        """
        #Unconcatenate all the data
        T1 = (data & 0x00000000000000000000000000000000000FFFFFFFF)
        T2 = (data & 0x000000000000000000000000000FFFFFFFF00000000) >> 32
        T3 = (data & 0x0000000000000000000FFFFFFFF0000000000000000) >> 64
        T4 = (data & 0x00000000000ffffffff000000000000000000000000) >> 96
        D1_4 = (data & 0x000ffffffff00000000000000000000000000000000) >> 128
        D0 = (data & 0x0FF0000000000000000000000000000000000000000) >> 160
        TMO = (data & 0xF000000000000000000000000000000000000000000) >> 168
        D1 = D1_4 & 0xFF
        D2 = D1_4 & 0xFF00
        D3 = D1_4 & 0xFF0000
        D4 = D1_4 & 0xFF000000
        return [T1, T2, T3, T4, D0, D1, D2 >> 8, D3 >> 16, D4 >> 24, TMO]

    def set_signal_generator(self,channel,enabled,frequency,pwmode,dc,delay):
        """
        Configure a channel of the signal generator

        :param channel: Channel to configure
        :param enabled: Whether this channel is enabled
        :param frequency: Frequency of this channel (Hz)
        :param pwmode: Decides whether the dc parameter specifies a duty cycle or a pulse width
        :param dc: Duty cycle or pulse width of the channel (0-1 or seconds)
        :param delay: The delay of this channel (seconds)
        :type channel: :class:`int`
        :type enabled: :class:`int`
        :type frequency: :class:`float`
        :type pwmode: :class:`int`
        :type dc: :class:`float`
        :type delay: :class:`float`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        if(channel>=4 or channel < 0):
            self.logger.error("Invalid channel")
            return 0
        self.logger.info("Configuring channel "+str(channel) + " with settings EN:"+str(int(enabled))+" FREQ: "+str(frequency)+"pwmode: "+str(int(pwmode))+" dcpw: "+str(dc)+" delay: "+str(delay))
        pgsettings = {"ch": channel, "enable":int(enabled), "frequency":frequency,"dc":dc,"del":delay,"dcm":int(pwmode)}
        data = "PG"+json.dumps(pgsettings)
        self.websocket.sendall(data.encode())

    def set_input_delay(self,channel,time):
        """
        Set the input delays of each input (including T0/TRIG and ETRIG)

        :param channel: Channel to adjust delay of (0-5)
        :param time: Time in seconds (MAX OF 4.836e-9 seconds)
        :type channel: :class:`int`
        :type time: :class:`float`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 0):
            self.logger.error("Cannot be used in high resolution mode")
            return 0
        if(time>=4.836e-9 or time < 0):
            self.logger.error("Time can only be between 0 and 4.836ns")
        delaytaps = int(time/DELAY_TAP_RESOLUTION)
        if(delaytaps >31):
            tap0 = 31
            tap1 = (delaytaps-31)&0b11111
        else:
            tap0 = delaytaps
            tap1 = 0
        delayconfig = "iDD"+json.dumps([int(channel),tap0,tap1])
        self.logger.info("Setting delay with config "+delayconfig)
        self.websocket.sendall(delayconfig.encode())
        sleep(0.3)
    def HRST_start(self):
        """
        Starts the high resolution single channel inter rising edge timer

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 1):
            self.logger.error("Cannot be used in default mode")
            return 0
        self.websocket.sendall("ST".encode())
    def HRST_set_delay(self,delays):
        """
        Manually set the delays of the high resolution single channel inter rising edge timer

        :param delays: The delays for each channel
        :type delays: :class:`list` of `int`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 1):
            self.logger.error("Cannot be used in default mode")
            return 0
        data = json.dumps(delays)
        self.websocket.sendall(("DD"+data).encode())
    def HRST_stop(self):
        """
        Stops the high resolution inter rising edge timer

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 1):
            self.logger.error("Cannot be used in default mode")
            return 0
        self.websocket.sendall("STOP".encode())
    def HRST_poll(self):
        """
        Poll the last acquired data from the high resolution inter rising edge timer

        :return: Time in seconds between the two rising edges
        :rtype: :class:`float`

        """
        if (self.connected == 0):
            self.logger.error("Not connected")
            return 0
        if (self.MODE != 1):
            self.logger.error("Cannot be used in default mode")
            return 0
        while 1:
            data = self.websocket.recv(1024).decode()

            if (data[:2] == "ST"):
                break
            else:
                self.logger.warning("Data not pertinent to ST received " + data)
        jsdec = json.JSONDecoder()
        timedata = jsdec.raw_decode(data[2:])
        self.logger.debug("DATA -- " + str(timedata[0]))
        self.logger.info("Single channel inter-rising-edge time: " + str(timedata[0]))
        return timedata[0]
    def restart(self):
        """
        Resets the programmable logic, can be reconfigured afterwards into high resolution mode or default mode

        """
        self.logger.warning("RECONFIGURING PROGRAMMABLE LOGIC")
        self.websocket.sendall("XX".encode())

class CounterMode(IntEnum):
    """
    Counter triggering mode
    """
    MANUAL_TRIGGER = 0
    EXTERNAL_TRIGGER = 1
    EXTERNAL_TRIGGER_STOP = 2


class SigGenMode(IntEnum):
    """
    Signal generator control modes, such as duty cycle mode, pulse width mode or channel enabled/disabled
    """
    DUTY_CYCLE_MODE = 0
    PULSE_WIDTH_MODE = 1
    ENABLED = 1
    DISABLED = 0

class LineSelectMode(IntEnum):
    """
    Line select mode for the coincidence timer, decides which line to treat as the start signal
    """
    L1FIRST = 0
    L2FIRST = 1
    DONTCARE = 2
class CHANNEL_SELECT(IntEnum):
    """
    Channel selection for all modules
    """
    CH1 = 0
    CH2 = 1
    CH3 = 2
    CH4 = 3
    T0 = 4
    E_TRIG = 5
class TimeControllerMode(IntEnum):
    """
    Mode to initialize the time controller in
    """
    DEFAULT_MODE = 0
    HIGH_RESOLUTION = 1