function [result] = differentialEq(a, x, b, n, varargin)
%This solves ordindary differential equations using the Taylor Series
%method. It is for a specific differential equation, namely
%   a and x are the starting values such that f(a) = x;
%   a and b define the interval in which the solution is computed, a < t < b
%   n is the number of steps between a and b;
%   varargin are the derivatives of the differential equation (x', x'',
%        etc) entered as function handles. They must be entered in this
%        form: second_der = @(t,x,first_der) .....
%        If more than 5 derivatives are needed, the code must be adjusted.
if b < a
    fprintf('Error: a must be less than b, a < b. \n');
    return;
elseif a == b
    fprintf('Error: a must be less than b, a < b. \n');
    return;
elseif isempty(varargin)
    fprintf('Error: must enter at least one derivative. \n');
    return;
elseif nargin > 9
    fprintf('Error: adjust code to use more than 5 derivatives. \n')
    return;
end
num_ders = nargin - 4;
matrix = zeros(n + 1,3);
h = (b - a) / n;
t = a;
array = [0, t, x];
matrix(1,:) = array;

switch (num_ders)
    case 1
        %der1 = @(t, x) varargin{1};
        for i = 1:n
            der1 = varargin{1}(t, x);
            x = x + h*der1;
            t = a + i*h;
            array = [i, t, x];
            matrix(1+i,:) = array;
        end
    case 2
        %der2 = @(t, x, der1) varargin{2};
        for i = 1:n
            der1 = varargin{1}(t, x);
            der2 = varargin{2}(t, x, der1);
            x = x + h*(der1 + 1/2*h*der2);
            t = a + i*h;
            array = [i, t, x];
            matrix(1+i,:) = array;
        end
    case 3
        %         der3 = @(t, x, der1, der2) varargin{3};
        for i = 1:n
            der1 = varargin{1}(t, x);
            der2 = varargin{2}(t, x, der1);
            der3 = varargin{3}(t, x, der1, der2);
            x = x + h*(der1 + 1/2*h*(der2 + 1/3*h*der3));
            t = a + i*h;
            array = [i, t, x];
            matrix(1+i,:) = array;
        end
    case 4
        %         der4 = @(t, x, der1, der2, der3) varargin{4};
        for i = 1:n
            der1 = varargin{1}(t, x);
            der2 = varargin{2}(t, x, der1);
            der3 = varargin{3}(t, x, der1, der2);
            der4 = varargin{4}(t, x, der1, der2, der3);
            x = x + h*(der1 + 1/2*h*(der2 + 1/3*h*(der3 + 1/4*h*der4)));
            t = a + i*h;
            array = [i, t, x];
            matrix(1+i,:) = array;
        end
    case 5
        %         der5 = @(t, x, der1, der2, der3, der4) varagin{5};
        for i = 1:n
            der1 = varargin{1}(t, x);
            der2 = varargin{2}(t, x, der1);
            der3 = varargin{3}(t, x, der1, der2);
            der4 = varargin{4}(t, x, der1, der2, der3);
            der5 = varargin{5}(t, x, der1, der2, der3, der4);
            x = x + h*(der1 + 1/2*h*(der2 + 1/3*h*(der3 + 1/4*h*(der4 + 1/5*h*der5))));
            %t = a + i*h;
            array = [i, t, x];
            matrix(1+i,:) = array;
        end
end
disp('       i        t         x')
disp(matrix(:,:))
result = x;
end