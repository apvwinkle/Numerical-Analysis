function [y_maxs, max_indices, y_mins, min_indices] = findPeaks(y_data)
%This finds the local maxima and minima in a data set by checking if a
%value at i is either greater than or less than both the i-1 and i+1 values.
%   y_data must be a vector with length greater than 3. This is similar to
%   Matlab's findpeaks() function, but it peaks pointing downwards as well
%   as upwards.

%Check for valid entry
[r, c] = size(y_data);
if r > 1 && c > 1
    fprintf('y_data must be a vector \n');
    return;
end

if length(y_data) < 3
    fprintf('y_data must have at least 3 data points \n');
    return;
end

%Declare starting values
y_maxs = [0];
max_indices = [0];
y_mins = [0];
min_indices = [0];
j_max = 0;
j_min = 0;

for i = 2:length(y_data)-1
    if y_data(i-1) < y_data(i) && y_data(i+1) < y_data(i)
        j_max = j_max + 1;
        if j_max == 1
            max_indices = i;
            y_maxs = y_data(i);
        else
            max_indices = [max_indices; i];
            y_maxs = [y_maxs; y_data(i)];
        end
    elseif y_data(i-1) > y_data(i) && y_data(i+1) > y_data(i)
        j_min = j_min + 1;
        if j_min == 1
            min_indices = i;
            y_mins = y_data(i);
        else
            min_indices = [min_indices; i];
            y_mins = [y_mins; y_data(i)];
        end
    end
end
end

