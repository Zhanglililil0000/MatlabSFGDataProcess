function data = BackgroundFreeAndNormalization(SamplePath,SampleName,BGPath,BGName,IRprofile,SamplingTime)
%扣除背景
    SignalRaw = GetData(SamplePath,SampleName);
    Signal = AutoCosmicRaysRemove(SignalRaw(:,3));
    BackgroundRaw = GetData(BGPath,BGName);
    Background = AutoCosmicRaysRemove(BackgroundRaw(:,3));
    Intensity = Signal - Background; 
    data = (Intensity./SamplingTime./IRprofile);
end