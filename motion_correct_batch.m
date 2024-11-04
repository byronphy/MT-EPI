%-----------------------------------------------------------------------
% Job saved on 17-Sep-2024 19:42:56 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clear;

cd '/nd_disk4/qinbolin/Bolin/Data/MT_EPI/20241031/QBL_MAXIAO_MT20241031/Func';
fileID=fopen(['NT.txt'],'r');
nTRs=fscanf(fileID,'%f');
files=[dir(['MT_ON.nii']),dir(['MT_OFF.nii'])];
for runs=1:length(files)
    allFiles=[];
    nTR=nTRs(runs);
    base=files(runs).name;
    for TR=1:nTR
        instant={[base ',' num2str(TR)]};
        allFiles=[allFiles;instant];
    end
    allFiles={allFiles};
    matlabbatch{runs}.spm.spatial.realign.estwrite.data = allFiles;
    matlabbatch{runs}.spm.spatial.realign.estwrite.eoptions.quality = 1;
    matlabbatch{runs}.spm.spatial.realign.estwrite.eoptions.sep = 1.2;
    matlabbatch{runs}.spm.spatial.realign.estwrite.eoptions.fwhm = 1;
    matlabbatch{runs}.spm.spatial.realign.estwrite.eoptions.rtm = 0;
    matlabbatch{runs}.spm.spatial.realign.estwrite.eoptions.interp = 4;
    matlabbatch{runs}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
    matlabbatch{runs}.spm.spatial.realign.estwrite.eoptions.weight = '';
    matlabbatch{runs}.spm.spatial.realign.estwrite.roptions.which = [2 1];
    matlabbatch{runs}.spm.spatial.realign.estwrite.roptions.interp = 4;
    matlabbatch{runs}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
    matlabbatch{runs}.spm.spatial.realign.estwrite.roptions.mask = 1;
    matlabbatch{runs}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
end
spm('defaults','FMRI');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);
exit
