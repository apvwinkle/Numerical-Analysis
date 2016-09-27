%GraphLineFittedAllData
LoadData

GraphData(f,s)
line_all_points = linear(f,s);
title('Line Fitted from All Data Points');
hold off

%Output from linear.m
% Error =
%    1.9031e-08