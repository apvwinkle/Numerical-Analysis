h = 1
x=0.5
for i = 1:27
    h = h/4;
    y = (sin(x+h) - sin(x))/h;
end
h