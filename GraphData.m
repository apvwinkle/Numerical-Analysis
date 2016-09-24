%Graphing the Astronomer's Raw Data
figure
A = xlsread('C:\Users\April\OneDrive\Senior Year\Numerical Analysis\spectrum.xls');
[r c] = size(A);
f = A(:,1);
s = A(:,2);
plot(f,s);
title('Astronomer''s Raw Data');
xlabel('Frequency (Hz)');
ylabel('Specific Intensity (W/Hz*m^2)');