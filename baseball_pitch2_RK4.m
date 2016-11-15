%General Constants
g = 32.174;
t0 = 0;
step_size = 1e-6;

%Pitch 2 constants
time_end2 = 0.354707;

pos = [-2.43; 50; 6.46];
vel = [9.46; -143.17; -9.15];
acc = [-23.08; 34.2; -26.09];

Cd = 0.3512265;
Cl = 0.216346;
phi = 4.591151161;
K = 0.005316103;

%Define functions for Pitch 2
x = [pos(1); pos(2); pos(3); vel(1); vel(2); vel(3)]; 
f2 = @(t, x)[x(4); ...
             x(5); ...
             x(6); ...
            -K*Cd*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(4) - K*Cl*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(5)*sin(phi); ...
            -K*Cd*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(5) + K*Cl*sqrt(x(4).^2+x(5).^2+x(6).^2)*(x(4)*sin(phi) - x(6)*cos(phi)); ...
            -K*Cd*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(6) + K*Cl*sqrt(x(4).^2+x(5).^2+x(6).^2)*x(5)*cos(phi) - g];

%Do RK4 for Pitch 1
[X2, T2] = RK4_3D(f2,x,0,time_end2,step_size);
figure;
plot3(X2(:,1),X2(:,2),X2(:,3))
xlabel('X'), ylabel('Y'), zlabel('Z')