#!/bin/bash

DICOM_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/DICOM"
NIFTI_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/NIFTI"

files=$(ls $DICOM_path)

for filename in $files
do
	echo   
	input_dcm_path=${DICOM_path}/${filename}
	output_nii_name=${filename}
	# dcm2niix -z y -f ${output_nii_name} -o ${NIFTI_path} ${input_dcm_path}
	dcm2niix -f ${output_nii_name} -o ${NIFTI_path} ${input_dcm_path}
done

echo "Done."
