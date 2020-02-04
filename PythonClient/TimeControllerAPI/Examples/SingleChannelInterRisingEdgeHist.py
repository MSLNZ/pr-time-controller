"""
Inter Rising Edge Timer:

This example outlines the use of the single channel inter rising edge time measurement function of the time controller.
Tis example showcases its use by generating a histogram of signal at CH1.
First, the start_iretimer() function must be called which will start the hardware module for it.
Next you can request data that is currently stored in the hardware FIFO using the function acquire_iretimer_data() which will return a list of times. If the signal is high speed, the module will stop listening to additional pulses until the FIFO is cleared through reads.
In order to shut down the module, call the stop_iretimer() function which will stop the module and hold it in reset.
"""


from TimeController import *
import _thread
from time import sleep
from time import perf_counter
from pyqtgraph.Qt import QtGui, QtCore
import numpy as np
import pyqtgraph as pg
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
SPT = TimeController("169.254.0.1",6050,0)
SPT.start_iretimer()
y1,x1 = np.histogram(data1[:curIndex],bins=np.linspace(0,1000e-9,1000))
temp1 = histplot.plot(x1, y1, stepMode=True, fillLevel=0, fillOutline=False, brush=(0,0,255,150))
def updatePlot():
    global data, histplot,app,curIndex,temp,size,SPT,lperf,fpsv,fpss
    perf = perf_counter()
    fpsv = 1/(perf-lperf)
    lperf=perf
    y1, x1 = np.histogram(data1[:curIndex], bins=np.linspace(0, 1000e-9, 1000))
    temp1.setData(x1, y1)
    histplot.setTitle("Captures: "+str(curIndex)+" FPS:"+str(fpss))
    app.processEvents()
def updateFPS():
    global fpsv,fpss
    fpss=fpsv
def acquireData():
    global data,curIndex,size,SPT
    while True:
        if(curIndex >= size):
            SPT.stop_iretimer()
            break
        times = SPT.acquire_iretimer_data()
        times1 = times
        if(curIndex+len(times) > size):
            data1[curIndex:size] = times1[0:(size-curIndex)]
        else:
            data1[curIndex:curIndex+len(times1)]=times1
        log.debug("TIME@"+str(curIndex)+"="+str(data1[curIndex]))
        curIndex+=len(times1)
        sleep(0)
timer = QtCore.QTimer()
timer.timeout.connect(updatePlot)
timer.start(2)
fpsc = QtCore.QTimer()
fpsc.timeout.connect(updateFPS)
fpsc.start(1000)
if __name__ == '__main__':
    import sys


    if (sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        _thread.start_new_thread(acquireData,( ))
        QtGui.QApplication.instance().exec_()

