%Sportsvision Trajectory
pos0 = [-2.509; 50; 5.928];
vel0 = [9.182; -132.785; -10.967];
acc0 = [-19.268; 30.713; -16.580];
t0 = 0;
front_of_home_plate_y = 1.417;

%Set up
POS = zeros(1+10^7, 3);
f = @(t) pos0 + (t-t0)'.*vel0 + .5.*(t-t0)'.^2.*acc0;
for i = 0:10^7
    t = i*10^-7;
    pos = f(t);
    POS(i+1,:) = pos;
    if pos(2) <= front_of_home_plate_y
        return
    end
end
t
pos
POS(all(POS==0,2),:)=[]
%display = [pos;t]; %used to find t value corresponding to y = 1.417, used to set cut off in t vector
plot3(POS(1,:),POS(2,:),POS(3,:));
xlabel('X'); ylabel('Y'); zlabel('Z')
title('Sportvision trajectory')
grid on
n = length(pos(1,:));
final_posn = pos(:,3803728);
final_posn
%how are we supposed to know which procedure fits the data better?


%%% the rest is the stuff we did trying to turn the first equation into a
%%% differential equation, I'm just leaving it so we can use it for part 2
%%% with the correct equation

f = @(t,x) [pos0(1) + (t-t0)*vel0(1) + .5*(t-t0).^2 * acc0(1); pos0(2) + (t-t0)*vel0(2) + .5*(t-t0).^2 * acc0(2); pos0(3) + (t-t0)*vel0(3) + .5*(t-t0).^2 * acc0(3)];


[X2,T2]=RK4_3D(f,[-2.509;50;5.928],0,4,.001);
plot(T2,X2)
plot3(X2(:,2),X2(:,1),X2(:,3)); 
ylabel('X'); xlabel('Y'); zlabel('Z');
grid on

%RK4 Soln
[T4,X4]=RK4vec(f,[-2.509;50;5.928],0,4,.001);
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