%GraphLinesFittedFromMidpointsBetweenPeaks
FindPeaksAndMidpoints

GraphData(f,s)
scatter(f([max_indices; min_indices]), s([max_indices; min_indices]), ...
    'Marker', 'o', 'MarkerEdgeColor','g','DisplayName','Peaks Found From Algorithm')
scatter(f(midpoints), s(midpoints), 'Marker', 'x', 'MarkerEdgeColor','k',...
    'DisplayName','Midpoints');
plot(f(midpoints), s(midpoints), 'Color','r','DisplayName','Lines Between Midpoints');
legend('show', 'Location', 'southwest');
title('Lines Fitted from Midpoints Between Peaks');
hold off