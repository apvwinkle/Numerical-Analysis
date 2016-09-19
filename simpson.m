function result = simpson(f, a, b,error, level_max)
%This function runs intsimpson, a recursive numerical integration function
%   f is a function, input using a function handle; a and b are the
%   endpoints of the interval (a < b); error is the desired accuracY; level
%   is the current level of recursion (the starting level should be 0);
%   level_max is the maximum number of recursions allowed before the
%   function will terminate.
tic
figure
global flag
flag = false;
level = 0;
result = intsimpson(f, a, b, error, level, level_max);
fplot(f,[a b], 'r')
if flag == true
    fprintf('Maximum level reached \n');
end
toc
end