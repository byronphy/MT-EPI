#!/bin/bash

upsample_rT1_path='upsample_rT1.nii'

upsample_meanMT_ON_path='upsample_meanMT_ON.nii'
upsample_MT_ON_beta_path='upsample_1_STATS_rMT_ON.nii'
upsample_MT_ON_t_path='upsample_2_STATS_rMT_ON.nii'

upsample_meanMT_OFF_path='upsample_meanMT_OFF.nii'
upsample_MT_OFF_beta_path='upsample_1_STATS_rMT_OFF.nii'
upsample_MT_OFF_t_path='upsample_2_STATS_rMT_OFF.nii'

# Edit:

rim_layers_path='rim_VR19_layers.nii'

# output file
layer_MT_ON_t_path='VR19_layer_MT_ON_t.dat'
layer_MT_OFF_t_path='VR19_layer_MT_OFF_t.dat'
layer_MT_ON_beta_path='VR19_layer_MT_ON_beta.dat'
layer_MT_OFF_beta_path='VR19_layer_MT_OFF_beta.dat'

#extractiong profiles for MT ON t
#get mean value, STDEV, and number of voxels
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -nzmean ${upsample_MT_ON_t_path} > layer_tem.dat
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -sigma ${upsample_MT_ON_t_path} >> layer_tem.dat
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -nzvoxels ${upsample_MT_ON_t_path} >> layer_tem.dat
#format file to be in columns, so gnuplot can read it.
WRD=$(head -n 1 layer_tem.dat|wc -w); 
for((i=2;i<=$WRD;i=i+2)); do 
awk '{print $'$i'}' layer_tem.dat| tr '\n' ' ';
echo; 
done > layer.dat
1dplot -sepscl layer.dat
mv layer.dat ${layer_MT_ON_t_path}

#extractiong profiles for MT OFF t
#get mean value, STDEV, and number of voxels
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -nzmean ${upsample_MT_OFF_t_path} > layer_tem.dat
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -sigma ${upsample_MT_OFF_t_path} >> layer_tem.dat
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -nzvoxels ${upsample_MT_OFF_t_path} >> layer_tem.dat
#format file to be in columns, so gnuplot can read it.
WRD=$(head -n 1 layer_tem.dat|wc -w); 
for((i=2;i<=$WRD;i=i+2)); do 
awk '{print $'$i'}' layer_tem.dat| tr '\n' ' ';
echo; 
done > layer.dat
1dplot -sepscl layer.dat
mv layer.dat ${layer_MT_OFF_t_path}


#extractiong profiles for MT ON beta
#get mean value, STDEV, and number of voxels
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -nzmean ${upsample_MT_ON_beta_path} > layer_tem.dat
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -sigma ${upsample_MT_ON_beta_path} >> layer_tem.dat
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -nzvoxels ${upsample_MT_ON_beta_path} >> layer_tem.dat
#format file to be in columns, so gnuplot can read it.
WRD=$(head -n 1 layer_tem.dat|wc -w); 
for((i=2;i<=$WRD;i=i+2)); do 
awk '{print $'$i'}' layer_tem.dat| tr '\n' ' ';
echo; 
done > layer.dat
1dplot -sepscl layer.dat
mv layer.dat ${layer_MT_ON_beta_path}

#extractiong profiles for MT OFF beta
#get mean value, STDEV, and number of voxels
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -nzmean ${upsample_MT_OFF_beta_path} > layer_tem.dat
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -sigma ${upsample_MT_OFF_beta_path} >> layer_tem.dat
3dROIstats -mask ${rim_layers_path} -1DRformat -quiet -nzvoxels ${upsample_MT_OFF_beta_path} >> layer_tem.dat
#format file to be in columns, so gnuplot can read it.
WRD=$(head -n 1 layer_tem.dat|wc -w); 
for((i=2;i<=$WRD;i=i+2)); do 
awk '{print $'$i'}' layer_tem.dat| tr '\n' ' ';
echo; 
done > layer.dat
1dplot -sepscl layer.dat
mv layer.dat ${layer_MT_OFF_beta_path}

#gnuplot "gnuplot_layers_t.txt"

#gnuplot "gnuplot_layers_beta.txt"


