function result = intsimpson(f,a,b,error, level, level_max)
%Numerical Integration via the adaptive Simpson's method
%   f is a function, input using a function handle;
%   a and b are the endpoints of the interval, with a < b;
%   error is the desired accuracy;
%   level is the current level of recursion (the starting level is 0);
%   level_max is the maximum number of recursions allowed before the
%        function will terminate.
global flag points
level = level + 1;
h = b - a;
c = (a + b)/2;
one_simpson = h*(f(a) + 4*f(c) + f(b))/6;
d = (a + c)/2;
e = (c + d)/2;
two_simpson = h*(f(a) + 4*f(d) + 2*f(c) + 4*f(e) + f(b))/12;
if level == 1
    points = [a b c d e];
else
    points = [points; a b c d e];
end

if level >= level_max
    result = two_simpson;
    flag = true;
    %disp('max level reached'); %if it is reached, it will display this
    %a lot of times! This functionality is now included in simpson.m
else
    if abs(two_simpson - one_simpson) < 15*error
        result = two_simpson + (two_simpson - one_simpson)/15;
        
    else
        left_simpson = intsimpson(f, a, c, error/2, level, level_max);
        right_simpson = intsimpson(f, c, b, error/2, level, level_max);
        result = left_simpson + right_simpson;
    end
end
end