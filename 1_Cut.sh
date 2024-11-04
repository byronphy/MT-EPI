#!/bin/bash

MTON_input_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/NIFTI/MT_ON.nii"
MTOFF_input_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/NIFTI/MT_OFF.nii"
output_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/Func"

MTON_output_path="${output_path}/MT_ON.nii"
MTOFF_output_path="${output_path}/MT_OFF.nii"

NT_txt_path="${output_path}/NT.txt"

# Drop the [0,1,2,3] and the last 9 volumes, copy the [4,5,6,7] in the front
NumVol=`3dinfo -nv ${MTON_input_path}`
3dTcat -overwrite -prefix ${MTON_output_path} ${MTON_input_path}[4..7] ${MTON_input_path}[4..`expr $NumVol - 10`]
3dTcat -overwrite -prefix ${MTOFF_output_path} ${MTOFF_input_path}[4..7] ${MTOFF_input_path}[4..`expr $NumVol - 10`]

# Save the TR number
3dinfo -nt ${MTON_output_path} >> ${NT_txt_path}
3dinfo -nt ${MTOFF_output_path} >> ${NT_txt_path}






