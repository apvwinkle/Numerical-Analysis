%Graphing the Line Fitted from All Data Points
figure
A = xlsread('C:\Users\April\OneDrive\Senior Year\Numerical Analysis\spectrum.xls');
f = A(:,1);
s = A(:,2);
linear(f,s)
title('Line Fitted from All Data Points')
xlabel('Frequency (Hz)');
ylabel('Specific Intensity (W/Hz*m^2)');

%Output from linear.m
Error =
   1.9031e-08
ans =
   1.0e-04 *
   -0.0000    0.4899