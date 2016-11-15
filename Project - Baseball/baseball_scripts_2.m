%Constants
pos1 = [-2.509 50 5.928]';
vel1 = [9.182 -132.785 -10.967]';
acc1 = [-19.268 30.713 -16.580]';
pos2 = [-2.43 50 6.46]';
vel2 = [9.46 -143.17 -9.15]';
acc2 = [-23.08 34.2 -26.09]';
t0 = 0;

%Set up
posn_f1 = f1(t1);
POS = zeros(1+10^7, 3);
f = @(t) pos1 + (t-t0)'.*vel1 + .5.*(t-t0)'.^2.*acc1;

%Run loop
for i = 0:10^7
    t = i*10^-7;
    pos = f(t);
    POS(i+1,:) = pos;
end

%Graph
display = [posn_f1;t1]; %used to find t value corresponding to y = 1.417, used to set cut off in t vector
plot3(posn_f1(1,:),posn_f1(2,:),posn_f1(3,:));
xlabel('X'); ylabel('Y'); zlabel('Z')
title('Sportvision trajectory')
grid on
n = length(posn_f1(1,:));
final_posn = posn_f1(:,3803728);
final_posn
%how are we supposed to know which procedure fits the data better?

%%2016 pitch
pos2 = [-2.43;50;6.46];
vel2 = [9.46;-143.17;-9.15];
acc2 = [-23.08;34.2;-26.09];

f2 = @(t) pos2 + (t-t0).*vel2 + .5.*(t-t0).^2.*acc2;
t2 = [0:.0000001:0.3520677];
posn_f2 = f2(t2);
display = [posn_f2;t2]; %used to find t value corresponding to y = 1.417, used to set cut off in t vector
plot3(posn_f2(1,:),posn_f2(2,:),posn_f2(3,:));
xlabel('X'); ylabel('Y'); zlabel('Z')
title('Sportvision trajectory')
grid on

%%plot both pitchees
hold on
plot3(posn_f1(1,:),posn_f1(2,:),posn_f1(3,:));

%%plot xy side to make sure they were both starting at y = 50
% this probably isn't a useful image for the actual project but we can do a
% similar analysis for comparing the two methods for each pitch
hold off
plot(posn_f1(1,:),posn_f1(2,:))
hold on
plot(posn_f2(1,:),posn_f2(2,:))
grid on
xlabel('X Trajectory'); ylabel('Y Trajectory');
title('X-Y Sportvision Trajectory of Pitch 1 and Pitch 2')

%YZ trajectory
hold off
plot(posn_f1(2,:),posn_f1(3,:))
hold on
plot(posn_f2(2,:),posn_f2(3,:))
grid on
xlabel('Y Trajectory'); ylabel('Z Trajectory');
title('Y-Z Sportvision Trajectory of Pitch 1 and Pitch 2')


%%% the rest is the stuff we did trying to turn the first equation into a
%%% differential equation, I'm just leaving it so we can use it for part 2
%%% with the correct equation

f1 = @(t,x) [pos1(1) + (t-t0)*vel2(1) + .5*(t-t0).^2 * acc2(1); pos1(2) + (t-t0)*vel2(2) + .5*(t-t0).^2 * acc2(2); pos1(3) + (t-t0)*vel2(3) + .5*(t-t0).^2 * acc2(3)];
[T2,X2]=RK2vec2(f1,[-2.509;50;5.928],0,4,.001);
plot(T2,X2)
plot3(X2(:,2),X2(:,1),X2(:,3)); 
ylabel('X'); xlabel('Y'); zlabel('Z');
grid on

%RK4 Soln
[T4,X4]=RK4vec(f1,[-2.509;50;5.928],0,4,.001);
plot(T4,X4)
plot3(X4(:,2),X4(:,1),X4(:,3))
ylabel('X'); xlabel('Y'); zlabel('Z');

%compare RK2 and RK4 solution
plot3(X4(:,2),X4(:,1),X4(:,3))
ylabel('X'); xlabel('Y'); zlabel('Z');
hold on
plot3(X2(:,2),X2(:,1),X2(:,3)); 
hold off

plot(T2,X2)
hold on
plot(T4,X4)
hold off