function dy = sinder(x, n)
%This estimates the derivative of the sine function at point x using n iterations.
%    This uses the definition of derivative equation f'(x) = lim(h->0)(f(x+h) - f(x))/h.
%    imax is the number of iterations reached (capped by error); emax is the amount of error at imax.

%Set up
emax = 0;
error = 10000; %an arbitrary large number
h = 1;
matrix = zeros(n, 4);
%Loop and find the derivative
for i = 1:n
    oldError = error;
    h = h/4;
    dy = (sin(x+h) - sin(x))/h;
    error = abs(cos(x) - dy);
    array = [i h dy error];
    matrix(i, :) = array;
    if error > oldError
        emax = oldError
        imax = i - 1
        break;
    end
end
%Print i h y error to the screen in one go so it's faster and cleaner
disp('       i        h        dy       error')
disp(matrix(1:imax,:))
end

