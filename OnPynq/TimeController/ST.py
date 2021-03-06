from pynq import MMIO
from pynq import Overlay
from time import sleep
import logging

COURSE_CLK = 150e6
SD_DIV = 16
FTIME = 1/(SD_DIV*COURSE_CLK)
log = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG,format='%(asctime)s [%(levelname)7s] %(module)s -- %(message)s')
DEFAULT_DELAY_CALIBRATIONS = [18,30,22,7]
class ST:
    def __init__(self):
        self.ov = Overlay("TEST_wrapper.bit",0)
        self.ov.download()
        self.DATA = MMIO(0x41200000,0x10000)
        self.UTIL = MMIO(0x41210000,0x10000)
        self.DELAY0 = MMIO(0x41220000,0x10000)
        self.DELAY1 = MMIO(0x41230000,0x10000)
        self.DEBUG = MMIO(0x41240000,0x10000)
        self.DUTIL = MMIO(0x41250000,0x10000)
        self.set_delays(DEFAULT_DELAY_CALIBRATIONS)
        log.info("Ready")

    def wait_for_rdy(self):
        """
        Waits until there is data ready to be acquired
        """
        while(self.UTIL.read(0x8)==0):
            pass

    def read_time(self):
        """
        Reads the time from the module

        :return: The calculated time in seconds
        :rtype: :class:`float`

        """
        course_time = self.DATA.read(0x0)
        log.debug("CT: "+str(course_time))
        finetimes = self.DATA.read(0x8)
        preftime = finetimes & 0xFF
        postftime = (finetimes & 0xFF00) >> 8
        log.debug("PRE: "+str(preftime))
        log.debug("POST: " + str(postftime))
        timetoconv = preftime - postftime
        timetoconv *= FTIME
        time = course_time/COURSE_CLK + timetoconv
        return time

    def proc(self):
        """
        The primary acquisition process, handles setting up and operation of the module.

        :return: Time in seconds
        :rtype: :class:`float`
        """
        self.DUTIL.write(0x0, 0x1)
        sleep(0.1)
        self.UTIL.write(0x0,0x1)
        self.wait_for_rdy()
        self.read_debug()
        time = self.read_time()
        log.info("TIME: "+str(time*1e9))
        self.UTIL.write(0x0,0x0)
        self.DUTIL.write(0x0,0x0)
        return time
    def set_delays(self,dels):
        """
        Sets the input delays of the module

        :param dels: List of input delays for each channel
        :type dels: :class:`list` of :class:`int`

        """
        self.DELAY0.write(0x0,int(dels[0]))
        self.DELAY0.write(0x8, int(dels[1]))
        self.DELAY1.write(0x0, int(dels[2]))
        self.DELAY1.write(0x8, int(dels[3]))
    def read_debug(self):
        """
        Debug function, not used
        """
        log.debug("STATEN: "+bin(self.DEBUG.read(0x0)))
        log.debug("STATEL: " + bin(self.DEBUG.read(0x8)))

