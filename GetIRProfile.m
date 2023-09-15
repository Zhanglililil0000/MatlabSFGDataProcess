function IRProfile = GetIRProfile(IRPath,IRName,IRBGPath,IRBGName,IRSamplingTime)
%用于计算IR profile
    IntensityRaw = GetData(IRPath,IRName);
    Intensity = IntensityRaw(:,2);
    Intensity = AutoCosmicRaysRemove(Intensity,3);
    BackgroundRaw = GetData(IRBGPath,IRBGName);
    Background = BackgroundRaw(:,2);
    Background = AutoCosmicRaysRemove(Background,3);
    IRProfile = (Intensity - Background)./IRSamplingTime;
end