# -*- coding: utf-8 -*-
"""
Created on Tue Jun  6 11:56:01 2017

@author: Leon
"""

import os 
import struct
import numpy as np

img = cv2.imread('img/PAN.tif',0)
equ = cv2.equalizeHist(img)
res = np.hstack((img,equ)) #stacking images side-by-side
cv2.imwrite('res.png',res)