%General Constants
g = 32.174;
t0 = 0;
time_end = 0.38;
step_size = 1e-6;

%Pitch 1 constants
pos = [-2.509; 50; 5.928];
vel = [9.182; -132.785; -10.967];
acc = [-19.268; 30.713; -16.580];

Cd = 0.3926485;
Cl = 0.255819;
phi = 236.0038*pi/180;
K = 0.005152949;

%Define functions for Pitch 1
x = [vel(1); pos(1); vel(2); pos(2); vel(3); pos(3)]; 
x = [pos(1); vel(1); pos(2); vel(2); pos(3); vel(3)]; 
f = @(x) [-K*Cd*sqrt(x(2).^2+x(4).^2+x(6).^2)*x(2) - K*Cl*sqrt(x(2).^2+x(4).^2+x(6).^2)*x(4)*sin(phi); ...
            x(2); ...
            -K*Cd*sqrt(x(2).^2+x(4).^2+x(6).^2)*x(4) + K*Cl*sqrt(x(2).^2+x(4).^2+x(6).^2)*(x(2)*sin(phi) - x(6)*cos(phi)); ...
            x(4); ...
            -K*Cd*sqrt(x(2).^2+x(4).^2+x(6).^2)*x(6) + K*Cl*sqrt(x(2).^2+x(4).^2+x(6).^2)*x(4)*cos(phi) - g; ...
            x(6);];

x = [0; pos(1); pos(2); pos(3)]; 
f = @(x) [  1
            -K*Cd*sqrt(x(2).^2+x(3).^2+x(4).^2)*x(2) - K*Cl*sqrt(x(2).^2+x(3).^2+x(4).^2)*x(3)*sin(phi); ...
            -K*Cd*sqrt(x(2).^2+x(3).^2+x(4).^2)*x(3) + K*Cl*sqrt(x(2).^2+x(3).^2+x(4).^2)*(x(2)*sin(phi) - x(4)*cos(phi)); ...
            -K*Cd*sqrt(x(2).^2+x(3).^2+x(4).^2)*x(4) + K*Cl*sqrt(x(2).^2+x(3).^2+x(4).^2)*x(3)*cos(phi) - g;];

x = [0; vel(1); pos(1); vel(2); pos(2); vel(3); pos(3)]; 
%x = [0; pos(1); vel(1); pos(2); vel(2); pos(3); vel(3)]; 
f = @(x) [ 1
            -K*Cd*sqrt(x(3).^2+x(5).^2+x(7).^2)*x(2) - K*Cl*sqrt(x(3).^2+x(5).^2+x(7).^2)*x(5)*sin(phi); ...
            x(3); ...
            -K*Cd*sqrt(x(3).^2+x(5).^2+x(7).^2)*x(4) + K*Cl*sqrt(x(3).^2+x(5).^2+x(7).^2)*(x(3)*sin(phi) - x(7)*cos(phi)); ...
            x(5); ...
            -K*Cd*sqrt(x(3).^2+x(5).^2+x(7).^2)*x(6) + K*Cl*sqrt(x(3).^2+x(5).^2+x(7).^2)*x(5)*cos(phi) - g; ...
            x(7);];
[T, X] = RK2vec2(f,x,0,time_end,step_size);

%Do RK4 for Pitch 1
[X, T] = RK4_3D(f,x,0,time_end,step_size);
plot3(X(:,1),X(:,2),X(:,3))
xlabel('X'), ylabel('Y'), zlabel('Z')


%Pitch 2 constants
pos = [-2.43; 50; 6.46];
vel = [9.46; -143.17; -9.15];
acc = [-23.08; 34.2; -26.09];

Cd = 0.3512265;
Cl = 0.216346;
phi = 4.591151161;
K = 0.005316103;

%Define functions for Pitch 2
x = [vel(1); pos(1); vel(2); pos(2); vel(3); pos(3)]; 
f2 = @(t,x) [-K*Cd*sqrt(x(1).^2+x(3).^2+x(5).^2)*x(2) - K*Cl*sqrt(x(1).^2+x(3).^2+x(5).^2)*x(4)*sin(phi); ...
            x(2); ...
            -K*Cd*sqrt(x(1).^2+x(3).^2+x(5).^2)*x(4) + K*Cl*sqrt(x(1).^2+x(3).^2+x(5).^2)*(x(2)*sin(phi) - x(6)*cos(phi)); ...
            x(4); ...
            -K*Cd*sqrt(x(1).^2+x(3).^2+x(5).^2)*x(6) + K*Cl*sqrt(x(1).^2+x(3).^2+x(5).^2)*x(4)*cos(phi) - g; ...
            x(6);];

%Do RK4 for Pitch 2
figure;
[X2, T2] = RK4_3D(f2,x,0,time_end,step_size);
plot3(X2(:,1),X2(:,2),X2(:,3))
xlabel('X'), ylabel('Y'), zlabel('Z')