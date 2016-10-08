%FindPeaksAndMidpoints
LoadData

[y_maxs, max_indices, y_mins, min_indices] = findPeaks(s);
e_peaks_inds = max_indices(y_maxs > 0.5000e-04)
a_peaks_inds = min_indices(y_mins < 0.3000e-04)
peaks_indices = sort([0; e_peaks_inds; a_peaks_inds; 4000]);
all_midpoints = peaks_indices(1:end-1) + ...
    floor((peaks_indices(2:end) - peaks_indices(1:end-1))/2);
midpoints = all_midpoints([1:4,6:7]) %remove midpoint between overlapping peaks

%Output
% e_peaks_inds =
%          881
%         1636
%         3656
% a_peaks_inds =
%         1406
%         2341
%         2379
% midpoints =
%          440
%         1143
%         1521
%         1988
%         3017
%         3828