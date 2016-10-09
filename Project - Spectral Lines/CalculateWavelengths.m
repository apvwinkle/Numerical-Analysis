%CalculateWavelengths
FindPeaksAndMidpoints

wavelength = zeros(length(midpoints),1);
c = 299792458; %speed of light, m/s^2
%frequency*wavelength = c, so
wavelength(1:end) = c./f(peaks_indices(2:end-1))