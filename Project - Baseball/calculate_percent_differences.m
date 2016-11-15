%%Pitch 1 percent differences
xperc1 = [posn_f1(:,end)', sum(posn_f1(:,end).^2)];
yperc1 = [X(end,1) X(end,2) X(end,3) sum(X(end,1:3).^2)];
percents1 = percentdifference(xperc1, yperc1)

%% Pitch 2 percent differences
xperc2 = [posn_f2(:,end)', sum(posn_f2(:,end).^2)];
yperc2 = [X2(end,1) X2(end,2) X2(end,3) sum(X2(end,1:3).^2)];
percents2 = percentdifference(xperc2, yperc2)