%FindLinesFittedFromMidpointsAndPeaksRemoved
LoadData

inbetween = 2363; %separates the overlapping peaks
midpoints = [440, 1143, 1521, 1988, inbetween, 3017, 3828];
left_bounds = [803, 1306, 1592, 2123, inbetween, 3584];
right_bounds = [948, 1505, 1680, inbetween, 2605, 3726];
points = [1:803, 948:1306, 1505:1592, 1680:2123, 2605:3584, 3726:4000];

chunk1 = [midpoints(1):left_bounds(1), right_bounds(1):midpoints(2)];
chunk2 = [midpoints(2):left_bounds(2), right_bounds(2):midpoints(3)];
chunk3 = [midpoints(3):left_bounds(3), right_bounds(3):midpoints(4)];
chunk45 = [midpoints(4):left_bounds(4), right_bounds(5):midpoints(6)];
chunk6 = [midpoints(6):left_bounds(6), right_bounds(6):midpoints(7)];

%Get lines from Raw Data
mb0 = noPlotLinear(f(1:midpoints(1)),s(1:midpoints(1)));
mb1 = noPlotLinear(f(chunk1),s(chunk1));
mb2 = noPlotLinear(f(chunk2),s(chunk2));
mb3 = noPlotLinear(f(chunk3),s(chunk3));
mb45 = noPlotLinear(f(chunk45),s(chunk45));
mb6 = noPlotLinear(f(chunk6),s(chunk6));
mb7 = noPlotLinear(f(midpoints(7):4000),s(midpoints(7):4000));

line0 = @(x) mb0(1)*x + mb0(2);
line1 = @(x) mb1(1)*x + mb1(2);
line2 = @(x) mb2(1)*x + mb2(2);
line3 = @(x) mb3(1)*x + mb3(2);
line45 = @(x) mb45(1)*x + mb45(2);
line6 = @(x) mb6(1)*x + mb6(2);
line7 = @(x) mb7(1)*x + mb7(2);

line0E = line0(f(1:midpoints(1)));
line1E = line1(f(midpoints(1):midpoints(2)));
line2E = line2(f(midpoints(2):midpoints(3)));
line3E = line3(f(midpoints(3):midpoints(4)));
line45E = line45(f(midpoints(4):midpoints(6)));
line6E = line6(f(midpoints(6):midpoints(7)));
line7E = line7(f(midpoints(7):4000));