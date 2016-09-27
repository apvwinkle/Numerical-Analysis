%GraphVerticalLineSeparatingPeaks
LoadData

bounds = [2123, 2605];
inbetween = 2363;
peaks = [2341, 2379];
midpoints = [1988, 3017];
eq = noPlotLinear(f([midpoints(1),midpoints(2)]), s([midpoints(1),midpoints(2)]));
Eqline = @(x) eq(1)*x + eq(2);
equation = ['y = ' num2str(eq(1)) '*x + ' num2str(eq(2))];
eval = Eqline(f(bounds(1):bounds(2)));

GraphData(f(bounds(1):bounds(2)),s(bounds(1):bounds(2)))
plot(f(bounds(1):bounds(2)),Eqline(f(bounds(1):bounds(2))), 'Color', 'r',...
    'DisplayName', equation);
plot(f([inbetween,inbetween]),[s(inbetween),Eqline(f(inbetween))],'Color','m',...
    'DisplayName','Line Separating Peaks')
legend('show', 'Location', 'southwest')
title('Overlapping Peaks Separation Line');
hold off