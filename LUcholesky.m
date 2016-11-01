function [L LT] = LUcholesky(A)
%This carries out LU factorization using the Cholesky method to get A = LL'
%   You will get
%   L as lower triangular
%   LT as lower triangular
n = size(A,1);
D = zeros(n,n);
[L D U] = LUdiagonal(A);
Dhalf = D^0.5;
LT = Dhalf*L';
L = L*Dhalf;
end