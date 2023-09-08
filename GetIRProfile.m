function IRProfile = GetIRProfile(WorkPath,IRProfileName,BackgroundIRProfile,IRprofileSamplingTime)
    Intensity = GetData(WorkPath,IRProfileName);
    Background = GetData(WorkPath,BackgroundIRProfile);
    IRProfile = (Intensity - Background)./IRprofileSamplingTime;
end