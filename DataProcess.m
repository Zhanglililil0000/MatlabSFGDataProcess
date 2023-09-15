%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SFG Data Process 
% By ZhangLi 2023.9.13
% School of Science， Westlake University
% Ver 1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 注意 Attention %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 需要更改的参数有：中心波长
% Parameters need to modify here: center wavelength of Visible beam
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear;




%%%%%%%%%%%%%%%%%%%% 读取待处理的文件 Read Files %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%选择红外文件; select the IR profile
[IRName, IRPath] = uigetfile('.csv','select IRprofile');
%选择红外的形状; select the background of IR profile
[IRBGName, IRBGPath] = uigetfile('.csv','select IR Profile Background'); 
%输入红外的采集时间; input the sampling time of IR profile
IRSamplingTime = inputdlg('IR Profile Sampling Time? (Unit: Second)'); 
IRSamplingTime = cell2mat(IRSamplingTime);

%选择需要处理的数据；select the SFG data
[SampleName,SamplePath] = uigetfile('.csv','select your SFG result','MultiSelect','on'); 
%选择这些样品的背景；select the background of SFG data
[BGName,BGPath] = uigetfile('.csv','select the background'); 
%输入样品的曝光时间；input the sampling time
SamplingTime = inputdlg('Sampling Time? (Unit: Second)');
SamplingTime = cell2mat(SamplingTime);
%获得要处理的样品数
SampleNumber = numel(SampleName);

%选择输出的路径
OutputPath = 'D:\Programing and Coding\MatlabSFGDataProcess\testdata\Export\';
%OutputPath = uigetdir('','select output folder');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% 实验条件 Basic Parameters %%%%%%%%%%%%%%%%%%%%%%%
% VIS_IncidentAngle = 45/180*3.13;
% IR_IncidentAngle = 55/180*3.14;
% VISpower
% IRpower

%VIS中心波长; center wavelength of Visible beam
VISCenter = 532.14; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% 数据处理 Data Process %%%%%%%%%%%%%%%%%%%%%%%%%%
%用于获取IR profile，此处已处理宇宙射线
IRprofile = GetIRProfile(IRPath,IRName,IRBGPath,IRBGName,IRSamplingTime);
Wavenumber = GetWavenumber(IRPath,IRName,VISCenter);
writematrix(Wavenumber,[OutputPath,'Wavenumber.csv','overwrite']); %输出波数
writematrix(IRprofile,[OutputPath,'IRprofile.csv','overwrite']); %输出IRprofile

%处理不同的文件
i = 1;
for i = SampleNumber
    clear signal;
    SampleName{i}
    Signal = BackgroundFreeAndNormalization(SamplePath,SampleName{i},BGPath,BGName,IRprofile,SamplingTime);
    writematrix(Signal,[OutputPath,SampleName{i}]);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%图表输出%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %根据需求修改输出结果
% 
% % plot(Wavenumber, Signal1,'r');
% % title(SampleName1);
% % hold on;
% % plot(Wavenumber, Signal2,'b');
% % xlim([2700 3200]);
% % title(SampleName2);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%结果输出%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% writematrix(Wavenumber,[OutputPath,'Wavenumber.csv']); %输出波数
% writematrix(IRprofile,[OutputPath,'IRprofile.csv']); %输出IRprofile




