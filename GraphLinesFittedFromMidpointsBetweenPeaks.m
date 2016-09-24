%Graph Mini-Peaks, Midpoints, and Lines Connecting Midpoints
figure
A = xlsread('C:\Users\April\OneDrive\Senior Year\Numerical Analysis\spectrum.xls');
f = A(:,1);
s = A(:,2);
plot(f,s,'Color','b','DisplayName','Raw Data');
title('Lines Fitted from Midpoints Between Peaks');
xlabel('Frequency (Hz)');
ylabel('Specific Intensity (W/Hz*m^2)');
hold on
[y_maxs, max_indices, y_mins, min_indices] = findPeaks(s);
scatter(f([max_indices; min_indices]), s([max_indices; min_indices]), ...
    'Marker', 'o', 'MarkerEdgeColor','g','DisplayName','Peaks')

e_peaks_inds = max_indices(y_maxs > 0.5000e-04);
a_peaks_inds = min_indices(y_mins < 0.3000e-04);
peaks_indices = sort([0; e_peaks_inds; a_peaks_inds; 4000]);
midpoints = peaks_indices(1:end-1) + ...
    floor((peaks_indices(2:end) - peaks_indices(1:end-1))/2);
scatter(f(midpoints), s(midpoints), 'Marker', 'x', 'MarkerEdgeColor','k', ...
    'DisplayName','Midpoints');
important_midpoints = midpoints([1:4,6:7])
plot(f(important_midpoints), s(important_midpoints), 'Color','r',...
    'DisplayName','Lines Between Midpoints');
legend('show', 'Location', 'southwest')

% %Output from findPeaks.m
% y_maxs =
%    1.0e-04 *
%     0.5854
%     0.3631
%     0.5142
%     0.2769
%     0.3558
%     0.5509
% max_indices =
%          881
%         1512
%         1636
%         2363
%         2547
%         3656
% y_mins =
%    1.0e-04 *
%     0.3668
%     0.2239
%     0.3629
%     0.1247
%     0.2570
%     0.3475
% min_indices =
%          795
%         1406
%         1590
%         2341
%         2379
%         3592