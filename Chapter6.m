%%%%% Chapter 6 Scripts for MATH 321

% Error check on f = @(x) cos(2*x)/exp(x)
xs = sym('xs');
fs = cos(2.*xs)/exp(xs)
fs4 = diff(diff(diff(diff(fs)))) %Fourth derivative, symbolic
f4 = @(x) - (7.*cos(2.*x))./exp(x) - (24.*sin(2.*x))./exp(x)
x=linspace(0,5*pi/4);
check = f4(x);
max(abs(check))  %-14.8064
((5*pi/4)^5/180*14.8064*10)^(1/4) %n~5.26

%Handout Example
( -(1/180).*(5/4).*pi.*(5.*pi./4).^4.*(-14.8)./0.1 ).^(1/4) %6.260076761848691
x = linspace(0,5*pi/4,7)
f = @(x) cos(2.*x)./exp(x)
[x;f(x)]'

% CK, p. 224
%Code as in the book
f = @(x) cos(2.*x)./exp(x)
simpson(f,0,5*pi/4,10^(-4),0,10)  %0.207872770201353

%Global variable, internal plot, works but Matlab gives warning
f = @(x) cos(2.*x)./exp(x)
simpson_open2(f,0,5*pi/4,10^(-4),0,10,1:5);

%Global variable, external plot, works but Matlab gives warning
[out,points] = simpson_open(f,0,5*pi/4,10^(-6),0,10,1:5);
simpson_plot(f,points)


%function out = simpson(f,a,b,epsilon,level,level_max)
%SIMPSON implements the Simpson's adaptive rule for numerical quadrature,
%algorithm from CK, p. 224
%f = function to integrate
%[a,b] = interval of integration
%epsilon = error
%level = the running level
%level.max = the maximum level you are willing to go
%out = the value of the integral

%function out = simpson_open2(f,a,b,epsilon,level,level_max,points)
%SIMPSON_OPEN2 implements the Simpson's adaptive rule for numerical quadrature,
%algorithm from CK, p. 224
%cp. SIMPSON which is basic Simpson, SIMPSON_OPEN which collects points for
%plotting, and SIMPSON_OPEN2 which plots
%f = function to integrate
%[a,b] = interval of integration
%epsilon = error
%level = the running level
%level.max = the maximum level you are willing to go
%out = the value of the integral
%points = the output points (entered points must be a 5-vector, but are
%stripped off)

%function [out,points] = simpson_open(f,a,b,epsilon,level,level_max,points)
%SIMPSON_OPEN implements the Simpson's adaptive rule for numerical quadrature,
%algorithm from CK, p. 224
%f = function to integrate
%[a,b] = interval of integration
%epsilon = error
%level = the running level
%level.max = the maximum level you are willing to go
%out = the value of the integral
%points = the output points (entered points must be a 5-vector, but are
%stripped off)
