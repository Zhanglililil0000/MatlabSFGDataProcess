function Wavenumber = GetWavenumber(WorkPath,IRName,VISCenter)
    data = GetData(WorkPath,IRName);
    Wavelength = data(:,1);
    Wavenumber = (1./Wavelength - 1/VISCenter).*10^7;
end