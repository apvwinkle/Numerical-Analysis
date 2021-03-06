function [area] = MCarea(xrange, yrange, n, m)
%   xrange is the range of x, in the form of [xmin, xmax]
%   yrange is the range of y, in the form of [ymin, ymax]
%   n is the number of points to be analyzed
%   m is the number of times the simulations is to be run
A = zeros(m,1);
for i = 1:m
    count = 0;
    x = xrange(1) + (xrange(2)-xrange(1)).*rand(n,1);
    y = yrange(1) + (yrange(2)-yrange(1)).*rand(n,1);
    for j = 1:n
        %Change conditional statements depending on the region
        if x(j)^3 + y(j)^3 <= 29 && exp(x(j)) - 2 <= y(j)
            count = count + 1;
        end
    end
    A(i) = count*abs((xrange(2)-xrange(1))*(yrange(2)-yrange(1)))/n;
end
area = mean(A);
figure
hold off
hist(A);
figure;
hold on
%Change plotting statements depending on the region
xplot = linspace(1,3);
f1 = @(x) exp(x) - 2;
f2 = @(x) (x.^3 - 29).^(1/3);
plot(xplot, f1(xplot), 'r');
plot(xplot, f2(xplot), 'g');
plot(x, y,  'o');
axis([xrange(1) xrange(2) yrange(1) yrange(2)]);
hold off
end
