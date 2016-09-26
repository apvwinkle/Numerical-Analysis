function sum = trapezoid(f, a, b, n)
%Numerical Integration via the trapezoid rule with uniform spacing, using
%vectorization rather than a loop
%   f is a function, input using a function handle;
%   a and b are the endpoints of the interval, with a < b;
%   n is the number of partitions of the x axis from a to b (n number of
%        subintervals)
tic
h = (b - a)/n;
x = a:h:b;
sum = 1/2*(x(2:end) - x(1:end-1))*(f(x(2:end)) + f(x(1:end-1)))';
toc
end