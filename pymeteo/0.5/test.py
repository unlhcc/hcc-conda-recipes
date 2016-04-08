#!/bin/env python

import sys, os
import matplotlib
matplotlib.use('qt5agg')
from PyQt5 import QtWidgets, QtGui, QtCore
from pymeteo.cm1 import MainInterface
app = QtWidgets.QApplication(sys.argv)
