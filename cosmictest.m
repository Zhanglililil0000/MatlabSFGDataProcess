close all;
clear;

FilePath = 'D:\Programing\Matlab\DataProcess\';
FileName = 'test';


data = GetData(FilePath,FileName);
Intensity = data(:,3);
position = data(:,1);
plot(position,Intensity);
hold on;

IntensityNew = AutoCosmicRaysRemove(Intensity,3);
plot(position,IntensityNew);


