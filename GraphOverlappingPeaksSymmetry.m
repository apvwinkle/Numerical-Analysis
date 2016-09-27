%GraphOverlappingPeaksSymmetry
LoadData

bounds = [2123, 2605];
inbetween = 2363;
peaks = [2341, 2379];
big_peak_switch = flipud(s(bounds(1):peaks(1)));
lil_peak_switch = flipud(s(peaks(2):bounds(2)));

GraphData(f(bounds(1):bounds(2)),s(bounds(1):bounds(2)))
plot(f(peaks(1):peaks(1)+length(bounds(1):peaks(1))-1), big_peak_switch,...
    'Color','g','DisplayName','Left Peak Superimposed')
plot(f(peaks(2)-length(peaks(2):bounds(2))+1:peaks(2)), lil_peak_switch,...
    'Color','c','DisplayName','Right Peak Superimposed')
legend('show','Location','southwest');
title('Overlapping Peaks Symmetry');
hold off