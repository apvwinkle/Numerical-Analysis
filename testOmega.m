function result = testOmega(A, b, xguess, omega_start, omega_end, omega_step_size)
%This runs through the solveMatrix function, testing different values of
%omega for the SOR method.
%   A is a square, n by n matrix
%   b is a vector of length n
%   xguess is a starting guess in the form of a vector of length n
%   omega determines the method and is the multiplier for SOR.
%       omega_start is the first value for omega
%       omega_end is the last value for omega= 0 yields the Jacobi method
%       omega_step_size determines the step size for omega.
n = length(omega_start:omega_step_size:omega_end);
OMEGA = zeros(n,1);
K = zeros(n,1);
for i = 1:n
    OMEGA(i) = omega_start + (i-1)*omega_step_size;
    [x, k] = solveMatrix(A, b, xguess, OMEGA(i));
    K(i) = k;
end
display('      Omega        K');
result = [OMEGA, K];
plot(OMEGA, K);
title('SOR: Number of Iterations per Omega Value');
xlabel('Value of Omega');
ylabel('Number of Iterations');
end