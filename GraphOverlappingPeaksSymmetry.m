%Graph Overlapping Peaks Symmetry
figure
A = xlsread('C:\Users\April\OneDrive\Senior Year\Numerical Analysis\spectrum.xls');
f = A(:,1);
s = A(:,2);
plot(f(2123:2605),s(2123:2605),'Color','b','DisplayName','Raw Data');
title('Overlapping Peaks Symmetry');
xlabel('Frequency (Hz)');
ylabel('Specific Intensity (W/Hz*m^2)');
hold on
left_bounds = 2123;
right_bounds = 2605;
inbetween = 2363;
peaks = [2341, 2379];

big_peak_switch = flipud(s(2123:2341));
lil_peak_switch = flipud(s(2379:2605));

plot(f(2341:2341+ length(2123:2341)-1),big_peak_switch,'Color','g',...
    'DisplayName','Left Peak Superimposed')
plot(f(2379-length(2379:2605)+1:2379),lil_peak_switch,'Color','c', ...
    'DisplayName','Right Peak Superimposed')
legend('show','Location','southwest')
hold off