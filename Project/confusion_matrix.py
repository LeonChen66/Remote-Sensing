# -*- coding: utf-8 -*-
"""
Created on Tue Jun 13 12:52:37 2017

@author: User
"""

import seaborn as sn
import pandas as pd
import matplotlib.pyplot as plt

array  = [[1528,138],[165,3169]]

df_cm = pd.DataFrame(array, index = [i for i in ['True','False']],
                  columns = [i for i in ['True','False']])
plt.figure(figsize = (10,7))
sn.heatmap(df_cm, annot=True,fmt='d')
sn.set(font_scale=3)
plt.title('Green Area Confusion Matrix')
plt.show()