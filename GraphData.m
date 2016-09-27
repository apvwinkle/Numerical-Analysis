function foo = GraphData(x,y)
%Graphs the Raw Data of Astronomer's Spectral Lines.
%   x (frequency) and y (specific intensity) should be vectors of even
%   length
figure
plot(x,y,'Color','b','DisplayName','Raw Data');
xlabel('Frequency (Hz)');
ylabel('Specific Intensity (W/Hz*m^2)');
hold on
end