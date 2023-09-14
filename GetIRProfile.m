function IRProfile = GetIRProfile(IRPath,IRName,IRBGPath,IRBGName,IRSamplingTime)
%用于计算IR profile
    IntensityRaw = GetData(IRPath,IRName);
    Intensity = CosmicRayRemove(IntensityRaw(:,3));
    BackgroundRaw = GetData(IRBGPath,IRBGName);
    Background = CosmicRayRemove(BackgroundRaw(:,3));
    IRProfile = (Intensity - Background)./IRSamplingTime;
end