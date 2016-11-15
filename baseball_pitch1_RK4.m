%General Constants
g = 32.174;
t0 = 0;
step_size = 1e-6;

%Pitch 1 constants
time_end1 =   0.383344;

pos = [-2.509; 50; 5.928];
vel = [9.182; -132.785; -10.967];
acc = [-19.268; 30.713; -16.580];

Cd = 0.3926485;
Cl = 0.255819;
phi = 236.0038*pi/180;
K = 0.005152949;

%Define functions for Pitch 1
x = [pos(1); pos(2); pos(3); vel(1); vel(2); vel(3)]; 
f1 = @(t, x)[x(4); ...
             x(5); ...
             x(6); ...
            -K*Cd*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(4) - K*Cl*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(5)*sin(phi); ...
            -K*Cd*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(5) + K*Cl*sqrt(x(4).^2+x(5).^2+x(6).^2)*(x(4)*sin(phi) - x(6)*cos(phi)); ...
            -K*Cd*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(6) + K*Cl*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(5)*cos(phi) - g];

%Do RK4 for Pitch 1
[X, T] = RK4_3D(f1,x,0,time_end1,step_size);
figure;
plot3(X(:,1),X(:,2),X(:,3))
xlabel('X'), ylabel('Y'), zlabel('Z')