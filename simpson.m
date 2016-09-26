function result = simpson(f, a, b, error, level_max)
%This function runs intsimpson, a recursive numerical integration function
%   f is a function, input using a function handle;
%   a and b are the endpoints of the interval (a < b);
%   error is the desired accuracy;
%   level_max is the maximum number of recursions allowed before the
%        function will terminate.
tic
figure
global flag points
points = zeros(1,5);
flag = false;
level = 0;
result = intsimpson(f, a, b, error, level, level_max);
x = linspace(a, b, 1000);
y = f(x);
plot(x, y, 'r')
hold on
[r c] = size(points);
for i = 1:r
    for j = 1:c
        plot(points(i,j), f(points(i,j)), 'bo')
    end
end
%plot(points, f(points))
if flag == true
    fprintf('Maximum level reached \n');
end
toc
end