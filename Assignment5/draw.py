# -*- coding: utf-8 -*-
"""
Created on Wed Jun  7 21:47:32 2017

@author: Leon
"""

import matplotlib.pyplot as plt
import numpy as np

RMS = [0.701,2.698,1.021,1.024]

plt.bar([0,1,2,3],RMS,align = 'center',width=0.3)
plt.title('sigma 0 Comparison')
plt.xticks((0,1,2,3),('1_MS','1_PAN','2_MS','2_PAN'))
plt.ylabel('sigma0')
plt.show()