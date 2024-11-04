#!/bin/bash

# Run MATLAB SPM
matlab -nodesktop -nosplash -r "motion_correct_batch"

# Plot the motion
gnuplot "2_gnuplot_motion.txt"






