function sum = inttrapezoid(f, a, b, n)
%Numerical Integration via the trapezoid rule with uniform spacing
%   f is a function, input using a function handle;
%   a and b are the endpoints of the interval where a < b;
%   n is the number of partitions of the x-axis from a to b (creating n
%        number of subintervals).
tic
h = (b - a)/n;
sum = 1/2*(f(a) + f(b));
for i = 1:n-1
    x = a + i*h;
    sum = sum + f(x);
end
sum = sum*h;
toc
end

