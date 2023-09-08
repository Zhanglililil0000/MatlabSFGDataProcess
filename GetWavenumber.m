function Wavenumber = GetWavenumber(WorkPath,IRprofileName,VISCenter)
    data = GetData(WorkPath,IRprofileName);
    Wavelength = data(:,2);
    Wavenumber = (1./Wavelength - 1/VISCenter).*10^7;
end