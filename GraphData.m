%Graphing the Astronomer's Data
A = xlsread('C:\Users\April\OneDrive\Senior Year\Numerical Analysis\spectrum.xls');
[r c] = size(A);
f = A(:,1);
s = A(:,2);
plot(f,s);