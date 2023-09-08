function data = BackgroundFreeAndNormalization(WorkPath,SampleName,BackgroundName,IRprofile,SamplingTime)
%扣除背景
    Signal = GetData(WorkPath,SampleName);
    Background = GetData(WorkPath,BackgroundName);
    Intensity = Signal(:,3) - Background(:,3);
    data = (Intensity./SamplingTime./IRprofile);
    data = AutoCosmicRaysRemove(data,3);
end