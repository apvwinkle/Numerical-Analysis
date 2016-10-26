function x = GaussElim(A, b)
%Solves a system of equations using Gaussian Elimination with scaled
%partial pivoting
%   A must be an n by n matrix
%   b is a vector of length n
n = length(b);
[row, col] = size(A);
if row ~= col
    fprintf('Error: A is not a square matrix!');
    return;
elseif row ~= n
    fprintf('Error: b is not of length n for matrix A of size n by n \n');
    return;
end

%Scaled partial pivoting
l = [1:n]';
S = max(abs(A), [], 2);
for k = 1:(n-1)
    rmax = 0;
    for i = k:n
        r = abs(A(l(i),k)/S(l(i)));
        if r > rmax
            rmax = r;
            j = i;
        end
    end
    vector = l(k);
    l(k) = l(j);
    l(j) = vector;
% forward elimination
    for i = (k+1):n
        xmult = A(l(i),k)/A(l(k),k); 
        A(l(i),k) = xmult;
        for j = (k+1):n
            A(l(i),j) = A(l(i),j) - xmult*A(l(k),j);
        end
    end
end
%back substitution
x = zeros(n,1);
for k = 1:(n-1)
    for i = (k+1):n
        b(l(i)) = b(l(i)) - A(l(i),k)*b(l(k));
    end
end
x(n) = b(l(n))/A(l(n),n);
for i = (n-1):-1:1
    sum = b(l(i));
    for j = (i+1):n
        sum = sum - A(l(i),j)*x(j);
    end
    x(i) = sum/A(l(i),i);
end
end