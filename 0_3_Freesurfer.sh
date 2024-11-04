#!/bin/bash

output_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/Anat"
name="20241029_MaLingyan"
MPRAGEised_stripMasked_path="/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241029/QBL_MALINGYAN_MT20241029/Anat/MPRAGEised_stripMasked.nii.gz"

recon_path="${output_path}/${name}_recon"
surf_path="${recon_path}/surf"
lh_path="${recon_path}/${name}_lh.pial.stl"
rh_path="${recon_path}/${name}_rh.pial.stl"

echo "Freesurfer"
export SUBJECTS_DIR=${output_path}
recon-all -i ${MPRAGEised_stripMasked_path} -s ${recon_path} -all

echo "Converting .pial to .pial.stl"
cd ${surf_path}
mris_convert lh.pial ${lh_path}
mris_convert rh.pial ${rh_path}

echo "Done."

