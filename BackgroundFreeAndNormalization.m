function data = BackgroundFreeAndNormalization(SamplePath,SampleName,BGPath,BGName,IRprofile,SamplingTime)
%扣除背景
    SignalRaw = GetData(SamplePath,SampleName);
    Signal = SignalRaw(:,2);
    Signal = AutoCosmicRaysRemove(Signal,3);
    BackgroundRaw = GetData(BGPath,BGName);
    Background = BackgroundRaw(:,2);
    Background = AutoCosmicRaysRemove(Background,3);
    Intensity = Signal - Background; 
    data = (Intensity./SamplingTime./IRprofile);
end