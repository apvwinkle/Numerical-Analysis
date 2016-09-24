%Graph Line Fitted from Data Not Including the Peaks
figure
A = xlsread('C:\Users\April\OneDrive\Senior Year\Numerical Analysis\spectrum.xls');
f = A(:,1);
s = A(:,2);
plot(f,s,'Color','b','DisplayName','Raw Data');
title('Lines Fitted from Data Not Including the Peaks');
xlabel('Frequency (Hz)');
ylabel('Specific Intensity (W/Hz*m^2)');
hold on
left_bounds = [803, 1306, 1592, 2123, 3584];
right_bounds = [948, 1505, 1680, 2605, 3726];
scatter(f(left_bounds), s(left_bounds), 'Marker', 'x', 'MarkerEdgeColor','g', ...
    'DisplayName','Left Bounds');
scatter(f(right_bounds), s(right_bounds), 'Marker', 'x', 'MarkerEdgeColor','c', ...
    'DisplayName','Right Bounds');
points = [1:803, 948:1306, 1505:1592, 1680:2123, 2605:3584, 3726:4000];
linear(f(points),s(points))
