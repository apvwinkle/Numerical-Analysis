function [T,X]=RK2(f,x,a,b,h)
%RK2 implements the Runge-Kutta method for solving initial value problems
%of order 2 from CK, p. 443
%f  = function
%x0 = initial value
%a, b = the desired interval
%h    = step size
%Example: f = @(t,x) sin(x + t.^2);
%         RK2(f,3,-4,4,8/100);

n=ceil((b-a)/h);
T=zeros(n,1); X=zeros(n,1);
t=a;
for j=1:n
    K1 = f(t, x);
    K2 = f(t + h, x + K1);
    x = x + (h./2).*(K1 + K2);
    t = a + j*h;
    T(j)=t; X(j)=x;
end
t,x
plot(T,X,'r')