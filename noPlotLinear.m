function eq = noPlotLinear(x,y)
%This calculates the best fit line to a set of (x,y) data points. eq
%contains [m b]. 
n = length(x);
m = length(y);
if n ~= m
    disp('Error: x and y do not have the same number of elements')
else
    Sx = sum(x);
    Sy = sum(y);
    Sxx = sum(x.^2);
    Sxy = sum(x.*y);
    %calculating the coefficients
    slope = (n*Sxy - Sx*Sy) / (n*Sxx - Sx^2);
    intercept = (Sxx*Sy - Sxy*Sx) / (n*Sxx - Sx^2);
end
for i = 1:length(x)
    E(i) = ( y(i) - (slope*x(i) + intercept) )^2;
end
%Error = sum(E)
eq = [slope intercept];
end