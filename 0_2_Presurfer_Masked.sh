#!/bin/bash

MPRAGEised_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/Anat/presurf_MPRAGEise/T1_MP2RAGE_SAG_P2_0_65_UNI_IMAGES_0015_MPRAGEised.nii"
brainMask_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/Anat/presurf_MPRAGEise/presurf_UNI/T1_MP2RAGE_SAG_P2_0_65_UNI_IMAGES_0015_MPRAGEised_brainmask.nii"
stripMask_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/Anat/presurf_INV2/T1_MP2RAGE_SAG_P2_0_65_INV2_0014_stripmask.nii"


output_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/Anat"

MPRAGEised_stripMasked_path="${output_path}/MPRAGEised_stripMasked.nii"
MPRAGEised_brainMasked_path="${output_path}/MPRAGEised_brainMasked.nii"

fslmaths ${MPRAGEised_path} -mul ${brainMask_path} ${MPRAGEised_brainMasked_path}
fslmaths ${MPRAGEised_path} -mul ${stripMask_path} ${MPRAGEised_stripMasked_path}
