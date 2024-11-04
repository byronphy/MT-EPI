#!/bin/bash

# input
rT1_path='/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/Layer/rT1.nii'

MT_ON_t_path='/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/Layer/2_STATS_rMT_ON.nii'
MT_OFF_t_path='/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/Layer/2_STATS_rMT_OFF.nii'

MT_ON_beta_path='/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/Layer/1_STATS_rMT_ON.nii'
MT_OFF_beta_path='/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/Layer/1_STATS_rMT_OFF.nii'

meanMT_ON_path='/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/Layer/meanMT_ON.nii'
meanMT_OFF_path='/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/Layer/meanMT_OFF.nii'

# output
upsample_rT1_path='upsample_rT1.nii'

upsample_MT_ON_t_path='upsample_2_STATS_rMT_ON.nii'
upsample_MT_OFF_t_path='upsample_2_STATS_rMT_OFF.nii'

upsample_MT_ON_beta_path='upsample_1_STATS_rMT_ON.nii'
upsample_MT_OFF_beta_path='upsample_1_STATS_rMT_OFF.nii'

upsample_meanMT_ON_path='upsample_meanMT_ON.nii'
upsample_meanMT_OFF_path='upsample_meanMT_OFF.nii'

# 5-fold upsampling
delta_x=$(3dinfo -di ${rT1_path})
delta_y=$(3dinfo -dj ${rT1_path})
delta_z=$(3dinfo -dk ${rT1_path})
sdelta_x=$(echo "((sqrt($delta_x * $delta_x) / 5))"|bc -l)
sdelta_y=$(echo "((sqrt($delta_y * $delta_y) / 5))"|bc -l)
sdelta_z=$(echo "((sqrt($delta_z * $delta_z) / 1))"|bc -l) 

#3dresample -dxyz $sdelta_x $sdelta_y $sdelta_z -rmode Cu -overwrite -prefix ${upsample_rT1_path} -input ${rT1_path}

#3dresample -dxyz $sdelta_x $sdelta_y $sdelta_z -rmode Cu -overwrite -prefix ${upsample_MT_ON_t_path} -input ${MT_ON_t_path}
#3dresample -dxyz $sdelta_x $sdelta_y $sdelta_z -rmode Cu -overwrite -prefix ${upsample_MT_OFF_t_path} -input ${MT_OFF_t_path}

#3dresample -dxyz $sdelta_x $sdelta_y $sdelta_z -rmode Cu -overwrite -prefix ${upsample_MT_ON_beta_path} -input ${MT_ON_beta_path}
#3dresample -dxyz $sdelta_x $sdelta_y $sdelta_z -rmode Cu -overwrite -prefix ${upsample_MT_OFF_beta_path} -input ${MT_OFF_beta_path}


3dresample -dxyz $sdelta_x $sdelta_y $sdelta_z -rmode Cu -overwrite -prefix ${upsample_meanMT_ON_path} -input ${meanMT_ON_path}
3dresample -dxyz $sdelta_x $sdelta_y $sdelta_z -rmode Cu -overwrite -prefix ${upsample_meanMT_OFF_path} -input ${meanMT_OFF_path}

