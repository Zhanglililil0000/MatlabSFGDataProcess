%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SFG数据处理 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 章力 2023.9.7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ver 1.0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%工作文件路径%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WorkPath = ''; % 数据路径
OutputPath = ''; % 保存路径

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%文件名%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%背景文件
BackgroundIRProfile = ''; %IRProfile背景文件名
BackgroundName = ''; %数据背景文件名



%%样品文件
IRprofileName = ''; %IRprofile文件名
SampleName1 = ''; %数据文件名
% SampleName2 = ''; %数据文件名
% SampleName3 = ''; %数据文件名
% SampleName4 = ''; %数据文件名
% SampleName5 = ''; %数据文件名
% SampleName6 = ''; %数据文件名


%%%%%%%%%%%%%%%%%%%%%%%%%%%%实验条件记录%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VIS_IncidentAngle = 45/180*3.13;
% IR_IncidentAngle = 55/180*3.14;
% VISpower
% IRpower
VISCenter = 532.14; %VIS中心波长

IRprofileSamplingTime = 30 ; % IRProfile采集时间
SamplingTime = 900 ; % 样品采集时间

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%数据处理%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IRprofile = GetIRProfile(WorkPath,IRprofileName,BackgroundIRProfile,IRprofileSamplingTime); %计算IRProfile，不用修改
IRprofile = AutoCosmicRaysRemove(IRprofile,3); %去除IRProfile的Cosmic Ray，可修改系数

%关于BackgroundFreeAndNormalization的函数说明
%BackgroundFreeAndNormalization(WorkPath,SampleName,BackgroundName,IRprofile,SamplingTime)有5个输入量
%WorkPath是工作路径，BackgroundName是背景名称，IRprofile是红外形状，SamplingTime是采集时间，都在文件最开始进行了定义，这里不用修改
%SampleName是样品名称，需要修改
Signal1 = BackgroundFreeAndNormalization(WorkPath,SampleName1,BackgroundName,IRprofile,SamplingTime); 
Signal2 = BackgroundFreeAndNormalization(WorkPath,SampleName2,BackgroundName,IRprofile,SamplingTime);

%这里波数的计算根据IRProfile进行计算，也不用修改
Wavenumber = GetWavenumber(WorkPath,IRprofileName,VISCenter);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%图表输出%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%根据需求修改输出结果

% plot(Wavenumber, Signal1,'r');
% title(SampleName1);
% hold on;
% plot(Wavenumber, Signal2,'b');
% xlim([2700 3200]);
% title(SampleName2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%结果输出%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
writematrix(Wavenumber,[OutputPath,'Wavenumber.csv']); %输出波数
writematrix(IRprofile,[OutputPath,'IRprofile.csv']); %输出IRprofile

Output(OutputPath,Signal1,SampleName1); % 输出结果
% Output(OutputPath,Signal2,SampleName2); % 输出结果
% Output(OutputPath,Signal3,SampleName3); % 输出结果
% Output(OutputPath,Signal4,SampleName4); % 输出结果
% Output(OutputPath,Signal5,SampleName5); % 输出结果
% Output(OutputPath,Signal6,SampleName6); % 输出结果


