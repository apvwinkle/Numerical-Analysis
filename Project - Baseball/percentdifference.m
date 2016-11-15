function [percents] = percentdifference(x,y)
%This calculates the percent difference between each x and y. 
%   x, y are column vectors
%   percentdiff = abs(x - y)/((x + y)/2) * 100
if length(x) ~= length(y)
    error('X and Y must have the same length');
end
n = length(x);
percents = zeros(n,1);
for i = 1:n
    percents(i) = abs(x(i) - y(i))/((x(i) + y(i))/2) * 100;
end
end