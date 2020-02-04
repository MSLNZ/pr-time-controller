"""
Pulse Counter:

This example outlines the use of the pulse counter function of the Time Controller.
The pulse counter has three modes:
    - The first is a manual trigger mode, where upon calling the counter, it counts for the specified window and returns the number of counts (effectively a frequency counter)
    - The second is an external trigger mode, where upon calling the pulse counter it waits until an external trigger on the T0 channel pulses after which it will count for the specified window duration.
    - The third is an external trigger and external stop mode, where upon calling the pulse counter, it waits till an external trigger on T0 and then stops on a seperate external trigger on the E_TRIG channel. The window argument in this case will have no effect.
"""
from TimeController import *
from time import sleep

TC = TimeController("169.254.0.1",6050,TimeControllerMode.DEFAULT_MODE)
while True:
    #cts = TC.run_pulse_counter(1,CounterMode.EXTERNAL_TRIGGER)
    cts = TC.run_pulse_counter(1,CounterMode.MANUAL_TRIGGER)
    # cts = TC.run_pulse_counter(1,CounterMode.EXTERNAL_TRIGGER_STOP)
    print("COUNT: "+str(cts))