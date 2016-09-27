%GraphSpectraAndIntegrate
LoadData

inbetween = 2363; %separates the overlapping peaks
midpoints = [440, 1143, 1521, 1988, inbetween, 3017, 3828];
left_bounds = [803, 1306, 1592, 2123, inbetween, 3584];
right_bounds = [948, 1505, 1680, inbetween, 2605, 3726];
points = [1:803, 948:1306, 1505:1592, 1680:2123, 2605:3584, 3726:4000];

chunk1 = [midpoints(1):left_bounds(1), right_bounds(1):midpoints(2)];
chunk2 = [midpoints(2):left_bounds(2), right_bounds(2):midpoints(3)];
chunk3 = [midpoints(3):left_bounds(3), right_bounds(3):midpoints(4)];
chunk4 = [midpoints(4):left_bounds(4)];
chunk5 = [right_bounds(5):midpoints(6)];
chunk6 = [midpoints(6):left_bounds(6), right_bounds(6):midpoints(7)];

%Get lines from Raw Data
mb0 = noPlotLinear(f(1:midpoints(1)),s(1:midpoints(1)));
mb1 = noPlotLinear(f(chunk1),s(chunk1))
mb2 = noPlotLinear(f(chunk2),s(chunk2))
mb3 = noPlotLinear(f(chunk3),s(chunk3))
mb4 = noPlotLinear(f(chunk4),s(chunk4))
mb5 = noPlotLinear(f(chunk5),s(chunk5))
mb6 = noPlotLinear(f(chunk6),s(chunk6))
mb7 = noPlotLinear(f(midpoints(7):4000),s(midpoints(7):4000))

line0 = @(x) mb0(1)*x + mb0(2);
line1 = @(x) mb1(1)*x + mb1(2);
line2 = @(x) mb2(1)*x + mb2(2);
line3 = @(x) mb3(1)*x + mb3(2);
line4 = @(x) mb4(1)*x + mb4(2);
line5 = @(x) mb5(1)*x + mb5(2);
line6 = @(x) mb6(1)*x + mb6(2);
line7 = @(x) mb7(1)*x + mb7(2);

%Subtract Lines from Raw Data
line0E = line0(f(1:midpoints(1)));
line1E = line1(f(midpoints(1):midpoints(2)));
line2E = line2(f(midpoints(2):midpoints(3)));
line3E = line3(f(midpoints(3):midpoints(4)));
line4E = line4(f(midpoints(4):midpoints(5)));
line5E = line5(f(midpoints(5):midpoints(6)));
line6E = line6(f(midpoints(6):midpoints(7)));
line7E = line7(f(midpoints(7):4000));

newS0 = s(1:midpoints(1))            - line0E;
newS1 = s(midpoints(1):midpoints(2)) - line1E;
newS2 = s(midpoints(2):midpoints(3)) - line2E;
newS3 = s(midpoints(3):midpoints(4)) - line3E;
newS4 = s(midpoints(4):midpoints(5)) - line4E;
newS5 = s(midpoints(5):midpoints(6)) - line5E;
newS6 = s(midpoints(6):midpoints(7)) - line6E;
newS7 = s(midpoints(7):4000)         - line7E;

%Graph Result
figure
hold on
plot([f(1),f(4000)],[0,0], 'k', 'DisplayName','X-axis')
plot(f(1:midpoints(1)),newS0,'DisplayName','Data with Continuous Spectra Removed')
plot(f(midpoints(1):midpoints(2)), newS1)
plot(f(midpoints(2):midpoints(3)), newS2)
plot(f(midpoints(3):midpoints(4)), newS3)
plot(f(midpoints(4):midpoints(5)), newS4)
plot(f(midpoints(5):midpoints(6)), newS5)
plot(f(midpoints(6):midpoints(7)), newS6)
plot(f(midpoints(7):4000),         newS7)
plot([f(1),f(4000)],[0,0], 'k', 'DisplayName','X-axis')
xlabel('Frequency (Hz)');
ylabel('Specific Intensity (W/Hz*m^2)');
legend('show')
title('Continuous Spectrum Removed')
hold off

%Integrate (the -1 is to make the number of data points odd)
i1 = regsimpson(f(midpoints(1):midpoints(2)-1), s(midpoints(1):midpoints(2)-1))
i2 = regsimpson(f(midpoints(2):midpoints(3)),   s(midpoints(2):midpoints(3)))
i3 = regsimpson(f(midpoints(3):midpoints(4)-1), s(midpoints(3):midpoints(4)-1))
i4 = regsimpson(f(midpoints(4):midpoints(5)-1), s(midpoints(4):midpoints(5)-1))
i5 = regsimpson(f(midpoints(5):midpoints(6)),   s(midpoints(5):midpoints(6)))
i6 = regsimpson(f(midpoints(6):midpoints(7)-1), s(midpoints(6):midpoints(7)-1))

%Output
% mb1 =
%    1.0e-04 *
%    -0.0000    0.4320
% mb2 =
%    1.0e-04 *
%    -0.0000    0.4731
% mb3 =
%    1.0e-04 *
%    -0.0000    0.4796
% mb4 =
%    1.0e-04 *
%    -0.0000    0.5325
% mb5 =
%    1.0e-04 *
%    -0.0000    0.5092
% mb6 =
%    1.0e-04 *
%    -0.0000    0.5434
% mb7 =
%    1.0e-04 *
%    -0.0000    0.5700

% i1 =
%    5.1832e+08
% i2 =
%    2.7031e+08
% i3 =
%    3.3882e+08
% i4 =
%    2.5522e+08
% i5 =
%    4.5663e+08
% i6 =
%    5.6837e+08