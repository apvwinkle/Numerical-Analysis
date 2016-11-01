function [L U] = LUcrout(A)
%This carries out LU factorization using the Crout method to get A = LU
%   You will get
%   L as lower triangular
%   U as unit upper triangular
n = size(A,1);
D = zeros(n,n);
[L D U] = LUdiagonal(A);
L = L*D;
end

