function [L LT] = LUcholesky2(A)
%This carries out LU factorization using the Cholesky method to get A = LL'
%   You will get
%   L  as lower triangular
%   L' as lower triangular
%   Please note that this is only possible if A is symmetric.
if ~issymmetric(A)
    error('Error: A is not a symmetric matrix.');
end
n = size(A,1);
L = zeros(n,n);
for k=1:n
    L(k,k) = (A(k,k) - sum(L(k,1:k-1).^2)).^0.5;
    for i = k+1:n
        L(i,k) = (A(i,k) - sum(L(i,1:k-1).*L(k,1:k-1)))/L(k,k);
    end
end
LT = L';
end