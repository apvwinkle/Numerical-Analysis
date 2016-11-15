function [T,X]=RK2vec(f,x,a,b,h)
%RK2vec implements the Runge-Kutta method for solving systems of 
%initial value problems %of order 2 from CK, p. 469
%f  = mx1 function
%x = mx1 initial value
%a, b = the desired interval
%h    = step size
%Example: f = @(t,x) [x(1) - x(2) + 2.*t - t.^2 - t.^3; x(1) + x(2) - 4.*t.^2 + t.^3];
%         [T,X]=RK2vec(f,[1;0],0,1,0.01);

n=ceil((b-a)/h);
m=length(x);
T=zeros(n,1); X=zeros(n,m);
t=a;
for j=1:n
    K1 = f(t, x);
    K2 = f(t + h, x + h*K1);
    x = x + (h/2).*(K1 + K2);
    t = a + j*h;
    T(j)=t; X(j,:)=x';
end
t,x
