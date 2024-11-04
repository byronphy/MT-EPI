#!/bin/bash

#cd /nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MAXIAO_MT20241029/Func

#3drefit -TR 2.38 rMT_ON.nii
#3drefit -TR 2.38 rMT_OFF.nii

#3dTstat -cvarinv -overwrite -prefix rMT_ON_tSNR.nii rMT_ON.nii
#3dTstat -cvarinv -overwrite -prefix rMT_OFF_tSNR.nii rMT_OFF.nii

#3dcalc -overwrite -a meanMT_ON.nii -b meanMT_OFF.nii -prefix OFF_m_ON.nii -expr 'b-a'

3dTstat -mean -overwrite -prefix rMT_ON_mean.nii rMT_ON.nii
3dTstat -mean -overwrite -prefix rMT_OFF_mean.nii rMT_OFF.nii



