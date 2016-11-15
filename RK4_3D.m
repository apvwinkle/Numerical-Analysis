function [X, T] = RK4_3D(f, x, a, b, h)
%This function solves a system of first-order Differential Equations using
%the Runga Kutta of Order Four method
%   f is a vector of functions, inputted as function handles
%   x is a vector of initial values, [x1; x2; ...], valued when x = a
%   a and b are the endpoints for the interval on which the DE system will
%       be solved (a is initial t value, x(a) = x; b is the final t-value,
%       giving the answer x(b).)
%   h is the step size
n = ceil((b - a)/h);
m = length(x);
t = a;
T = zeros(n,1);
X = zeros(n,m);
for i = 1:n
    K1 = h*f(t        , x         );
    K2 = h*f(t + 0.5*h, x + 0.5*K1);
    K3 = h*f(t + 0.5*h, x + 0.5*K2);
    K4 = h*f(t +     h, x +     K3);
    x  = x + (1/6)*(K1 + 2*K2 + 2*K3 + K4);
    T(i,1) = t;
    X(i,:) = x;
    t = a + i*h;
end
t
x
end