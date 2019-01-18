# -*- coding: utf-8 -*-
"""
Created on Wed Jun  7 08:30:08 2017

@author: Leon
"""

import cv2
import numpy as np
import pandas as pd
from numpy.linalg import inv


def affine(ctr_txt,start,end):

    x = ctr_txt['COL'].values[start-1:end]
    y = ctr_txt['ROW'].values[start-1:end]
    E = ctr_txt['E'].values[start-1:end]
    N = ctr_txt['N'].values[start-1:end]

    n = end-start+1
    A = np.zeros((2*n,6))
    
    for i in range(n):
        A[2*i,0:3] = [x[i],y[i],1]
        A[2*i+1,3:6] = [x[i],y[i],1]
    
    L = np.dstack((E,N)).ravel()[:2*n]
    
    X = inv(A.T@A)@(A.T@L)
    V = A@X-L
    sigma_0 = np.sqrt(V.T@V/(n*2-6))
    print('X = ' ,X)
    print('V = ',V)
    print('sigma_0 = ',sigma_0)
    return X

def rmse(ctr_txt,start,end,X):
    x = ctr_txt['COL'].values[start-1:end]
    y = ctr_txt['ROW'].values[start-1:end]
    E = ctr_txt['E'].values[start-1:end]
    N = ctr_txt['N'].values[start-1:end]
    
    E_X = x*X[0]+y*X[1]+X[2]
    N_Y = x*X[3]+y*X[4]+X[5]
    print(E-E_X)
    print(N-N_Y)
    RMSE_X = np.sqrt(((E-E_X)**2).sum()/(end-start+1))
    RMSE_Y = np.sqrt(((N-N_Y)**2).sum()/(end-start+1))
    print('RMSE_X: ',RMSE_X)
    print('RMSE_Y: ',RMSE_Y)
    RMSE = np.sqrt((RMSE_X**2+RMSE_Y**2)/2)
    print('RMSE: %f' %RMSE)

def main():
    txt_name = 'PAN_control.txt'
    ctr_txt = pd.read_csv(txt_name,delimiter=' ')
    X = affine(ctr_txt,6,10)
    np.savetxt('text.txt',X,fmt='%.4f')
    rmse(ctr_txt,1,5,X)
    
if __name__=="__main__":
    main()