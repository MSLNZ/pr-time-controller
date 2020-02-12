"""
Time Tagger:

-This example demonstrates the use of the Time Tagger functionality of the Time Controller.
-This module after recieving a T0 pulse, tag each pulse on each of the 4 channels with a time after T0.
-To start this module call start_time_tagger(timeout), this will start the time tagger upon which it will immediately begin acquiring data. The timeout argument
defines how long the time tagger will wait for pulses on each channel after which it will stop waiting and push the acquired data into the FIFO.
-To acquire the latest set of data from the FIFO call acquire_time_tagger_data(), this will return a dictionary containing time data for each channel including a binary encoded integer stating which
channels have timed out.
-This example also shows the use of adjusting input delays using the function set_input_delay() which accepts channel defined by the enum class CHANNEL_SELECT and a time in seconds from 0 to 4.836ns
"""

from pyqtgraph.Qt import QtGui, QtCore
import numpy as np
import pyqtgraph as pg
from TimeController import *
import _thread
from time import sleep
from time import perf_counter
import logging
log = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s [%(levelname)7s] %(module)s -- %(message)s')
from pyqtgraph.ptime import time
curIndex = 0
app = QtGui.QApplication([])
fpsv = 0
fpss = 0
lperf = perf_counter()
size = 10000000
data1 = np.zeros(size)
data2 = np.zeros(size)
data3 = np.zeros(size)
data4 = np.zeros(size)
histplot = pg.plot()
histplot.setTitle("Help")
histplot.setRange(QtCore.QRectF(0, 0, 1000e-9, 1000))
histplot.setLabel('bottom', 'Interval', units='s')
histplot.setLabel('left', 'Counts', units='')
SPT = TimeController("169.254.0.1",6050,TimeControllerMode.DEFAULT_MODE)
SPT.set_input_delay(CHANNEL_SELECT.CH1,3.5e-9)
SPT.set_input_delay(CHANNEL_SELECT.CH2,3.5e-9)
SPT.set_input_delay(CHANNEL_SELECT.CH3,3.5e-9)
SPT.set_input_delay(CHANNEL_SELECT.CH4,3.5e-9)
SPT.start_time_tagger(0.5)
y1,x1 = np.histogram(data1[:curIndex],bins=np.linspace(0,1000e-9,1000))
y2,x2 = np.histogram(data2[:curIndex],bins=np.linspace(0,1000e-9,1000))
y3,x3 = np.histogram(data3[:curIndex],bins=np.linspace(0,1000e-9,1000))
y4,x4 = np.histogram(data4[:curIndex],bins=np.linspace(0,1000e-9,1000))
temp1 = histplot.plot(x1, y1, stepMode=True, fillLevel=0, fillOutline=True, brush=(0,0,255,150))
temp2 = histplot.plot(x2, y2, stepMode=True, fillLevel=0, fillOutline=True, brush=(0,255,255,150))
temp3 = histplot.plot(x3, y3, stepMode=True, fillLevel=0, fillOutline=True, brush=(0,255,0,150))
temp4 = histplot.plot(x4, y4, stepMode=True, fillLevel=0, fillOutline=True, brush=(255,0,0,150))
def updatePlot():
    global data, histplot,app,curIndex,temp,size,SPT,lperf,fpsv,fpss
    perf = perf_counter()
    fpsv = 1/(perf-lperf)
    lperf=perf
    y1, x1 = np.histogram(data1[:curIndex], bins=np.linspace(0, 1000e-9, 1000))
    y2, x2 = np.histogram(data2[:curIndex], bins=np.linspace(0, 1000e-9, 1000))
    y3, x3 = np.histogram(data3[:curIndex], bins=np.linspace(0, 1000e-9, 1000))
    y4, x4 = np.histogram(data4[:curIndex], bins=np.linspace(0, 1000e-9, 1000))
    temp1.setData(x1, y1)
    temp2.setData(x2, y2)
    temp3.setData(x3, y3)
    temp4.setData(x4, y4)
    histplot.setTitle("Captures: "+str(curIndex)+" FPS:"+str(fpss))
    app.processEvents()
def updateFPS():
    global fpsv,fpss
    fpss=fpsv
def acquireData():
    #This is assuming no time outs occur, to ensure timed out channel's times dont get recorded, it is essential to check whether the channel has timed out (time out states are in the original dict) and NOT place that item into the list
    global data,curIndex,size,SPT
    while True:
        if (curIndex >= size):
            SPT.stop_time_tagger()
            break
        times = SPT.acquire_time_tagger_data()
        times1 = times["T1"]
        times2 = times["T2"]
        times3 = times["T3"]
        times4 = times["T4"]
        if(curIndex+len(times) > size):
            data1[curIndex:size] = times1[0:(size-curIndex)]
            data2[curIndex:size] = times2[0:(size - curIndex)]
            data3[curIndex:size] = times3[0:(size - curIndex)]
            data4[curIndex:size] = times4[0:(size - curIndex)]

        else:
            data1[curIndex:curIndex+len(times1)]=times1
            data2[curIndex:curIndex + len(times2)] = times2
            data3[curIndex:curIndex + len(times3)] = times3
            data4[curIndex:curIndex + len(times4)] = times4
        log.debug("TIME@"+str(curIndex)+"="+str(data1[curIndex]))
        curIndex+=len(times1)
        sleep(0)
timer = QtCore.QTimer()
timer.timeout.connect(updatePlot)
timer.start(2)
fpsc = QtCore.QTimer()
fpsc.timeout.connect(updateFPS)
fpsc.start(1000)
#_thread.start_new_thread(updatePlot,( ))
if __name__ == '__main__':
    import sys


    if (sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        _thread.start_new_thread(acquireData,( ))
        QtGui.QApplication.instance().exec_()