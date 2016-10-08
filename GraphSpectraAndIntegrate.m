%GraphSpectraAndIntegrate
FindLinesFittedFromMidpointsAndPeaksRemoved

newS0 = s(1:midpoints(1))            - line0E;
newS1 = s(midpoints(1):midpoints(2)) - line1E;
newS2 = s(midpoints(2):midpoints(3)) - line2E;
newS3 = s(midpoints(3):midpoints(4)) - line3E;
%newS4 = s(midpoints(4):midpoints(5)) - line4E;
%newS5 = s(midpoints(5):midpoints(6)) - line5E;
newS45 = s(midpoints(4):midpoints(6)) - line45E;
newS6 = s(midpoints(6):midpoints(7)) - line6E;
newS7 = s(midpoints(7):4000)         - line7E;

newS = [newS0(1:end-1); (newS0(end)+newS1(1))/2; newS1(2:end-1);(newS1(end)+newS2(1))/2; ...
        newS2(2:end-1); (newS2(end)+newS3(1))/2; newS3(2:end-1);(newS3(end)+newS45(1))/2;...
       newS45(2:end-1);(newS45(end)+newS6(1))/2; newS6(2:end-1);(newS6(end)+newS7(1))/2 ; newS7(2:end)];

%Graph Result
figure
hold on
plot([f(1),f(4000)],[0,0], 'k', 'DisplayName','X-axis')
plot(f(1:midpoints(1)),newS0,'DisplayName','Data with Continuous Spectra Removed')
plot(f([midpoints(5),midpoints(5)]),[0,newS(inbetween)],'Color','m',...
    'DisplayName','Line Separating Peaks')
scatter(f(midpoints), zeros(1,7), 'Marker', 'x', 'MarkerEdgeColor','k', ...
    'DisplayName','Midpoints');
%scatter(f(right_bounds), zeros(6,1), 'Marker', 'x', 'MarkerEdgeColor','c', ...
%    'DisplayName','Right Bounds');
plot(f(midpoints(1):midpoints(2)), newS1)
plot(f(midpoints(2):midpoints(3)), newS2)
plot(f(midpoints(3):midpoints(4)), newS3)
plot(f(midpoints(4):midpoints(6)), newS45)
plot(f(midpoints(6):midpoints(7)), newS6)
plot(f(midpoints(7):4000),         newS7)
plot([f(1),f(4000)],[0,0], 'k', 'DisplayName','X-axis') %plot again so it's on top

xlabel('Frequency (Hz)');
ylabel('Specific Intensity (W/Hz*m^2)');
legend('show')
title('Continuous Spectrum Removed')
hold off

%Integrate (the -1 is to make the number of data points odd)
i1 = regsimpson(f(midpoints(1):midpoints(2)-1), newS(midpoints(1):midpoints(2)-1))
i2 = regsimpson(f(midpoints(2):midpoints(3)),   newS(midpoints(2):midpoints(3)))
i3 = regsimpson(f(midpoints(3):midpoints(4)-1), newS(midpoints(3):midpoints(4)-1))
i4 = regsimpson(f(midpoints(4):midpoints(5)-1), newS(midpoints(4):midpoints(5)-1))
i5 = regsimpson(f(midpoints(5):midpoints(6)),   newS(midpoints(5):midpoints(6)))
i6 = regsimpson(f(midpoints(6):midpoints(7)-1), newS(midpoints(6):midpoints(7)-1))

%Output
% i1 =
%      3.571175285697836e+06
% i2 =
%     -4.959915629138962e+06
% i3 =
%      1.550831202340777e+06
% i4 =
%     -1.323257523422912e+07
% i5 =
%     -7.807478438726648e+06
% i6 =
%      3.235339671150900e+06