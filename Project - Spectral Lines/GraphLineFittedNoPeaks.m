%GraphLineFittedNoPeaks
LoadData

%Left and Right bounds found by eye
left_bounds = [803, 1306, 1592, 2123, 3584];
right_bounds = [948, 1505, 1680, 2605, 3726];
points = [1:803, 948:1306, 1505:1592, 1680:2123, 2605:3584, 3726:4000];

GraphData(f,s)
scatter(f(left_bounds), s(left_bounds), 'Marker', 'x', 'MarkerEdgeColor','g', ...
    'DisplayName','Left Bounds');
scatter(f(right_bounds), s(right_bounds), 'Marker', 'x', 'MarkerEdgeColor','c', ...
    'DisplayName','Right Bounds');
%Graph the line fitted from all points except those in the peaks' bounds
linear(f(points),s(points))
title('Lines Fitted from Data Not Including the Peaks');
hold off