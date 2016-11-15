function [X,Y] = randreg(f,a,b,n)
%RANDREG finds n points under the 2D region of curve f in the interval [a,b]
%Example: f = @(x) exp(-x.^2); [X,Y]=randreg(f,-1,1,100)

X = zeros(n,1); Y = rand(n,1);
x = linspace(a,b,10000); y = f(x);
by = max(y); ay = 0; %Grab max for y and set min for y = 0
for i = 1:n
    x = (b -a).*rand()+ a;      %Obtain first point pair (x,y)
    y = by.*rand();
    while y > f(x)              %If the point is out of bounds, get another
        x = (b-a).*rand() + a;
        y = by.*rand();
    end %while
    X(i) = x; Y(i) = y;         %Store point
end %for i

x=linspace(a,b);                
plot(x,f(x))                    %Plot curve
hold on
plot(X,Y,'r.')                  %Plot random points
    