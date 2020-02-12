from TimeController import *
from time import sleep
REPEATS = 100
TC = TimeController("169.254.0.1",6050,TimeControllerMode.HIGH_RESOLUTION)
TC.HRST_start()
for i in range(REPEATS):
    print(TC.HRST_poll())
    sleep(0.5)
