function [L U] = LUdoolittle(A)
%This carries out LU factorization using the Doolittle method to get A = LU
%   You will get
%   L as unit lower triangular
%   U as upper triangular
if size(A,1) ~= size(A,2)
    error('Matrix must be square.');
end
n = size(A,1);
L = zeros(n,n);
U = zeros(n,n);
for k = 1:n
    L(k,k) = 1;
    for j = k:n
        U(k,j) = A(k,j) - sum(L(k,1:k-1)*U(1:k-1,j));
    end
    for i = k+1:n
        L(i,k) = (A(i,k) - sum(L(i,1:k-1)*U(1:k-1,k)))/U(k,k);
    end
end
end

