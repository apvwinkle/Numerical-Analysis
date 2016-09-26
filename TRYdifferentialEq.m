function [x] = TRYdifferentialEq(a, x, b, n, varagin)
%This solves ordindary differential equations using the Taylor Series
%method. I tried to use varagin so that any number of derivatives could be
%entered, but I realized that this would take too long for a simple
%assignment. I may come back to this later.
%   a and x are the starting values such that f(a) = x;
%   a and b define the interval in which the solution is computed, a < t < b
%   n is the number of steps between a and b;
%   varagin are the derivatives of the differential equation (x', x'',
%   etc.), entered as function handles.
if ~(a < b)
    sprintf('Error: a must be less than b, a < b.');
    return;
elseif isempty(varagin)
    sprintf('Error: must enter at least one derivative.');
    return;
end

num_ders = abs(nargin(differentialEq)) - 4;
varagin{num_ders + 1} = @(

%Problem: how to make x = x + h*x' + (1/2)*(h^2)*h'' + (1/3)*(h^3)*h''' + ...
% in varagin when we don't know how many derivatives there are, so we don't
% know how many arguments to pass to varagin{k}(x,x',x'',x''', etc)



place = ones(num_ders + 1, 1)
place(1,1) = x;
matrix = zeros(n + 1,3)
h = (b - a) / n
t = a;
array = [0, t, x];
matrix(1,:) = array;
for i = 1:n
    for j = 1:num_ders
        place(j+1,1) = varagin{j}(x);
        
        varagin{i}
    end
    
    disp('       i        t         x')
    disp(matrix(:,:))
end

