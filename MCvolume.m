function [volume] = MCvolume(f, n, m, xrange, yrange, zrange)
%This uses the Monte Carlo area method to find the volume of a specified
%region.
%   f is a function, input as a function handle
%   n is the number of points to be analyzed
%   x is the range of x, in the form of [xmin, xmax]
%   y is the range of y, in the form of [ymin, ymax]
%   z is the range of z, in the form of [zmin, zmax]
for i = 1:m
    x = xrange(1) + (xrange(2)-xrange(1)).*rand(n,1);
    y = yrange(1) + (yrange(2)-yrange(1)).*rand(n,1);
    z = zrange(1) + (zrange(2)-zrange(1)).*rand(n,1);
    V = zeros(n,1);
    V(1:n) = f(x(1:n),y(1:n),z(1:n));
    vol(i) = sum(V)*abs((xrange(2)-xrange(1))*(yrange(2)-yrange(1))*(zrange(2)-zrange(1)))/n;
end
volume = mean(vol);
hist(vol);
end