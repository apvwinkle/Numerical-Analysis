function determinant = diagonalDet(D)
%This finds the determinant of a diagonal matrix D
if size(A,1) ~= size(A,2)
    error('Matrix must be square.')
end
n = size(A,1);
determinant = 1;
for i = 1:n
    determinant = determinant*D(i,i);
end