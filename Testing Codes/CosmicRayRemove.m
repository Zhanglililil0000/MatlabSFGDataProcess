close all;
clear;

FilePath = '';
FileName = '';


data = GetData(FilePath,FileName);
Intensity = data(:,2);
position = data(:,1);
plot(position,Intensity);
hold on;

IntensityNew = AutoCosmicRaysRemove(Intensity,2);
plot(position,IntensityNew);


