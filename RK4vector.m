function [x, t] = RK4vector(f, x, a, b, n)
%This function solves a system of first-order Differential Equations using
%the Runga Kutta of Order Four method
%   f is a vector of functions, inputted as function handles
%   x is a vector of initial values, beginning when x = a
%   a and b are the endpoints for the interval on which the DE system will
%       be solved (a is initial t value, x(a) = x; b is the final t-value,
%       giving the answer x(b).)
%   h is the step size
%n = ceil((b - a)/h);
h = (b - a)/n;
m = length(x);
t = a + h;
T = zeros(n,1);
X = zeros(n,1);
for i = 2:n+10
    K1 = h*f(t        , x         );
    K2 = h*f(t + 0.5*h, x + 0.5*K1);
    K3 = h*f(t + 0.5*h, x + 0.5*K2);
    K4 = h*f(t +     h, x +     K3);
    x  = x + (1/6)*(K1 + 2*K2 + 2*K3 + K4);
    T(i,1) = t;
    X(i,1) = x;
    t = a + i*h;
end
plot(T,X)
xlabel('T'); ylabel('X');
end

