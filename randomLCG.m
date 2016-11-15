function [X] = randomLCG(n, seed, option)
%Pseudo-random number generation y the Linear Congruential Generator method
%   n is the number of output points desired
%   seed is the starting number
%   option 'yes' scales the points onto [0, 1];
%   option 'no' leaves the points as integers
%   The equation is: Xn+1 = (a*Xn + c)mod(m), where
%       Xn is the nth random number generated in a series of random numbers
%       a is the multiplier, 0 < a
%       c is the increment, 0 <= c < m
%       m is the modulus, 0 < m
%   If changing the values of a, m, and c; the following rules should be
%   used to obtain a full period:
%       c, m relatively prime
%       a - 1 is divisible by all prime factors of m
%       a - 1 is a multiple of 4 if m is a multiple of 4
a = 21;
c = 3;
m = 100;
X = zeros(n, 1);
X(1) = seed;
for i = 1:n - 1
    X(i+1) = mod(a*X(i) + c, m);
end
switch option
    case 'yes'
        X = X/m;
    case 'no'
end
end