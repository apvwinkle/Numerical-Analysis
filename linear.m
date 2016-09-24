function eq = linear(x,y)
%This calculates the best fit line to a set of (x,y) data points. eq
%contains [m b]. It also plots the data points and the fitted line.

%plot(x,y,'b')
%plot(x,y,'Color','b','DisplayName','Raw Data');
hold on;
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
Error = sum(E)
eq = [slope intercept];
xcalc = linspace(min(x),max(x));
ycalc = slope*xcalc + intercept;
equation = ['y = ' num2str(slope) '*x + ' num2str(intercept)];
plot(xcalc,ycalc, 'Color', 'r', 'DisplayName', equation);
legend('show', 'Location', 'southwest')
%title(equation)
end