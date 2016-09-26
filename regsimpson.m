function result = regsimpson(x, y)
%Numerical Integration via the composite Simpson's method using
%evenly-spaced (x,y) datapoints
%   x and y are vectors of datapoints
%   a and b are the endpoints of the interval, with a < b;
%   n is the number of subintervals;
n = length(x) - 1;
h = (x(end)- x(1))/n;
if floor((n+1)/2) == (n+1)/2
    fprintf('Error: x and y must have an odd number of data points. \n');
    return
end
if ~(length(x) == length(y))
    fprintf('Error: x and y must have the same number of data points. \n');
    return
end
sum1 = sum(y(1) + y(n+1));
sum2 = sum(y(3:2:n));
sum3 = sum(y(2:2:n+1));
result = h/3*(sum1 + 2*sum2 + 4*sum3);
end