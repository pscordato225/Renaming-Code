%Renaming Sandwich Beach Cam photos based on the date. The main set path is
%'D:\Scodato_SSF_2018\Source Code'. 

%Add dependent paths.
addpath(genpath('D:\Scodato_SSF_2018\Source Code'));
addpath(genpath(''));

%Create a new directory to store your renamed files if this is the first time. 
%new_dir= mkdir('D:\Scodato_SSF_2018\Projects\SandwichBeachCam\images\2017\c1\2017_master')


%Load images using Exif from the desired folder. 
imagePn= 'D:\Scodato_SSF_2018\Projects\SandwichBeachCam\images\2017\c1\2017_master_old';
d=dir(imagePn);

%Specify where you want to put your photos. 
outputPn= 'D:\Scodato_SSF_2018\Projects\SandwichBeachCam\images\2017\c1\2017_master';
%Redefine variable to only get DateModified for all images. The outer range
% in the for loop is the number of images in your original directory.
for i= 3: length(d)
    %Preparing input file name
    inputFn= fullfile(d(i).folder, d(i).name);
    %Preparing output file name
    d(i).name;
    TS= ['"D:\Scodato_SSF_2018\Source Code\ExifTool\exiftool.exe" -FileModifyDate ' ,fullfile(d(i).folder, d(i).name)];
    [statis, e]= system(TS);
    fn= e(35:53);
    fn2= [erase(fn, ':'), 'L'];
    fn3= replace(fn2, ' ', 'T');
    oldFileName= d(i).name;
    newFileName= [erase(oldFileName, d(i).name), fn3];
    newFileName2= strcat(newFileName, '.jpg');
    outputFn= fullfile(outputPn, newFileName2);
    copyfile(inputFn, outputFn);
   
    %newPn= fullfile('D:\Scodato_SSF_2018\Projects\SandwichBeachCam\images\2016\c1\renamed', newFileName2)
    %newFileName3= system(['rename' oldPn newFileName2]);
    %copyfile(d(i).name, newFileName2)

end
    



