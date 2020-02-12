"""
Two Channel Coincidence Timer:

This example outlines the use of the Coincidence Timer functionality of the Time Controller, which willl be used to geneate a histogram of times.
-To start the module, call the function start_coincidence_timer(lineselect) which will pull the module out of reset and cause it to begin acquiring data. The argument lineselect defines
which channel will be treated as the start signal. It is defined by the Enum class LineSelectMode.
-To request the latest acquired set of data, call acquire_coincidence_timer_data(), this will return a list of times.
-To stop the coincidence timer, call stop_coincidence_timer() this will pull the module back into reset shutting it down.
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
SPT.start_coincidence_timer(LineSelectMode.L1FIRST)
y1,x1 = np.histogram(data1[:curIndex],bins=np.linspace(0,1000e-9,1000))
temp1 = histplot.plot(x1, y1, stepMode=True, fillLevel=0, fillOutline=True, brush=(0,0,255,150))
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
            SPT.stop_coincidence_timer()
            break
        times = SPT.acquire_coincidence_timer_data()
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

