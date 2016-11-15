%General Constants
g = 32.174;
t0 = 0;
step_size = 1e-6;

%Pitch 1 constants
time_end1 = 0.3547;

pos = [-2.509; 50; 5.928];
vel = [9.182; -132.785; -10.967];
acc = [-19.268; 30.713; -16.580];

Cd = 0.3926485;
Cl = 0.255819;
phi = 236.0038*pi/180;
K = 0.005152949;

%Define functions for Pitch 1
x1 = [pos(1); pos(2); pos(3); vel(1); vel(2); vel(3)]; 
f1 = @(t, x) [x1(4); ...
             x1(5); ...
             x1(6); ...
            -K*Cd*sqrt(x1(4).^2+x1(5).^2+x1(6).^2)*x1(4) - K*Cl*sqrt(x1(4).^2+x1(5).^2+x1(6).^2)*x1(5)*sin(phi); ...
            -K*Cd*sqrt(x1(4).^2+x1(5).^2+x1(6).^2)*x1(5) + K*Cl*sqrt(x1(4).^2+x1(5).^2+x1(6).^2)*(x1(4)*sin(phi) - x1(6)*cos(phi)); ...
            -K*Cd*sqrt(x1(4).^2+x1(5).^2+x1(6).^2)*x1(6) + K*Cl*sqrt(x1(4).^2+x1(5).^2+x1(6).^2)*x1(5)*cos(phi) - g];

%Do RK4 for Pitch 1
[X, T] = RK4_3D(f1,x,0,time_end1,step_size);
plot3(X(:,1),X(:,2),X(:,3))
xlabel('X'), ylabel('Y'), zlabel('Z')


%Pitch 2 constants
time_end2 = 0.3393;

pos = [-2.43; 50; 6.46];
vel = [9.46; -143.17; -9.15];
acc = [-23.08; 34.2; -26.09];

Cd = 0.3512265;
Cl = 0.216346;
phi = 4.591151161;
K = 0.005316103;

%Define functions for Pitch 2
x2 = [pos(1); pos(2); pos(3); vel(1); vel(2); vel(3)]; 
f2 = @(t, x) [x2(4); ...
             x2(5); ...
             x2(6); ...
            -K*Cd*sqrt(x2(4).^2+x2(5).^2+x2(6).^2)*x2(4) - K*Cl*sqrt(x2(4).^2+x2(5).^2+x2(6).^2)*x2(5)*sin(phi); ...
            -K*Cd*sqrt(x2(4).^2+x2(5).^2+x2(6).^2)*x2(5) + K*Cl*sqrt(x2(4).^2+x2(5).^2+x2(6).^2)*(x2(4)*sin(phi) - x2(6)*cos(phi)); ...
            -K*Cd*sqrt(x2(4).^2+x2(5).^2+x2(6).^2)*x2(6) + K*Cl*sqrt(x2(4).^2+x2(5).^2+x2(6).^2)*x2(5)*cos(phi) - g];

%Do RK4 for Pitch 1
[X2, T2] = RK4_3D(f2,x2,0,time_end2,step_size);
figure;
plot3(X2(:,1),X2(:,2),X2(:,3))
xlabel('X'), ylabel('Y'), zlabel('Z')
