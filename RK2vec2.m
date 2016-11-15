function [T,X]=RK2vec2(f,x,a,b,h)
%RK2vec2 implements the Runge-Kutta method for solving systems of 
%initial value problems of order 4 from CK, p. 471-2
%It differs from RK2vec in that it incorporates t as a DE, with the result
%that there is no variable t, only x(m+1)=t
%f  = mx1 function
%x = mx1 initial value
%a, b = the desired interval
%h    = step size
%Example: f2 = @(x) [1; x(2) - x(3) + 2.*x(1) - x(1).^2 - x(1).^3; x(2) + x(3) - 4.*x(1).^2 + x(1).^3];
%[T3,X3]=RK2vec2(f2,[0;1;0],0,1,0.01);
%plot3(X3(:,2),X3(:,3),X3(:,1),'r')  %Show how it does rotations

n=ceil((b-a)/h);
m=length(x);
T=zeros(n,1); X=zeros(n,m);
t=a;
for j=1:n
    K1 = f(x);
    K2 = f(x + h*K1);
    x = x + (h/2).*(K1 + K2);
    t = a + j*h;
    T(j)=t; X(j,:)=x';
end
t,x
