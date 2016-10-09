%GraphLinesFromMidpointsAndPeaksRemoved
FindLinesFittedFromMidpointsAndPeaksRemoved

GraphData(f,s)
plot(f(1:midpoints(1)),line0E,'Color', 'r', 'DisplayName','Fitted Lines')
plot(f(midpoints(1):midpoints(2)), line1E, 'r')
plot(f(midpoints(2):midpoints(3)), line2E, 'r')
plot(f(midpoints(3):midpoints(4)), line3E, 'r')
plot(f(midpoints(4):midpoints(6)), line45E, 'r')
plot(f(midpoints(6):midpoints(7)), line6E, 'r')
plot(f(midpoints(7):4000),         line7E, 'r')
legend('show', 'Location', 'southwest')
title('Lines Fitted Between Midpoints with Peaks Removed from Data')
hold off