function [x k] = solveMatrix(A, b, xguess, omega)
%This uses an iterative solution to solve a linear system Ax = b. The three
%methods to be chosen from are Jacobi (omega=0), Gauss-Seidel (omega=1),
%and Successive Overrelaxation (0<omega<2, omega ~=1).
%   A is a square, n by n matrix
%   b is a vector of length n
%   xguess is a starting guess in the form of a vector of length n
%   omega determines the method and is the multiplier for SOR.
%       omega = 0 yields the Jacobi method
%       omega = 1 yields the Gauss-Seidel method
%       0 < omega < 2, omega not equal to 1, yields the SOR method
if ~isvector(b)
    error('b must be a vector');
elseif ~isvector(xguess)
    error('xguess must be a vector');
elseif length(xguess) ~= length(b)
    error('b and xguess must have the same length');
elseif size(A,1) ~= size(A,2)
    error('A must be a square matrix');
elseif length(xguess) ~= size(A,1)
    error('b and xguess must have length n for square matrix A of size n.');
elseif omega < 0 || 2 < omega
    error('omega must be between 0 and 2');
end
kmax = 1000;
delta = 1e-10;
err = 0.5e-4;
n = size(A,1);
x = xguess;
for k = 1:kmax
    y = x;
    for i = 1:n
        sum = b(i);
        diag = A(i,i);
        if abs(diag) < delta
            fprintf('diagonal element too small \n');
            return;
        end
        %Choose method
        switch omega
            case 0  %Jacobi
                if k == 1 && i == 1
                    fprintf('Jacobi method \n');
                end
                for j = 1:n
                    if j ~= i
                        sum = sum - A(i,j)*y(j);
                    end
                end
                x(i) = sum/diag;
            case 1  %Gauss-Seidel
                if k == 1 && i == 1
                    fprintf('Gauss-Seidel method \n');
                end
                for j = 1:i-1
                    sum = sum - A(i,j)*x(j);
                end
                for j = i+1:n
                    sum = sum - A(i,j)*x(j);
                end
                x(i) = sum/diag;
            otherwise %SOR method
                if k == 1 && i == 1;
                    fprintf('SOR method \n');
                end
                for j = 1:i-1
                    sum = sum - A(i,j)*x(j);
                end
                for j = i+1:n
                    sum = sum - A(i,j)*x(j);
                end
                x(i) = sum/diag;
                x(i) = omega*x(i) + (1 - omega)*y(i);
        end
        %case ends here
    end
    if norm(x - y) < err
        return;
    end
end
fprintf('maximun iterations reached\n')
end