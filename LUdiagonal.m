function [L D U] = LUdiagonal(A)
%This carries out LU factorization using the doolittle method, and then
%finds diagonal matrix D to get A = LDU
%   You will get
%   L as unit lower triangular
%   D as a diagonal matrix
%   U as unit upper triangular
n = size(A,1);
D = zeros(n,n);
[L U] = LUdoolittle(A);
for i = 1:n
    D(i,i) = U(i,i);
    U(i,:) = U(i,:)./D(i,i);
end
end