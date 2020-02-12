"""
Signal Generator:

This example outlines the use of the signal generator.
The signal generator has adjustable frequency, duty cycle and delays which can all be set using the set_signal_generator function.
Warning:
Ensure sufficient time between each signal generator request is given as the generator takes some time to configure and sending commands to quickly will result in errors. A good rule of thumb is 500ms
"""
from TimeController import *
from time import sleep

TC = TimeController("169.254.0.1",6050,TimeControllerMode.DEFAULT_MODE)
TC.set_signal_generator(CHANNEL_SELECT.CH1,SigGenMode.ENABLED,1000000,SigGenMode.DUTY_CYCLE_MODE,0.5,0.0)
sleep(0.5)
TC.set_signal_generator(CHANNEL_SELECT.CH2,SigGenMode.ENABLED,2000000,SigGenMode.DUTY_CYCLE_MODE,0.1,0.0)
sleep(0.5)
TC.set_signal_generator(CHANNEL_SELECT.CH3,SigGenMode.ENABLED,1000000,SigGenMode.DUTY_CYCLE_MODE,0.5,0.0)
sleep(0.5)
TC.set_signal_generator(CHANNEL_SELECT.CH4,SigGenMode.ENABLED,1000000,SigGenMode.DUTY_CYCLE_MODE,0.5,0.0)