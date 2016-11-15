t0 = 0;
f1 = @(t) pos1 + (t-t0).*vel1 + .5.*(t-t0).^2.*acc1;

POS = zeros(1+10^7, 3);
f = @(t) pos1 + (t-t0)'.*vel1 + .5.*(t-t0)'.^2.*acc1;
for i = 0:10^7
    t = i*10^-7;
    pos = f(t);
    POS(i+1,:) = pos;
    if pos(2) <= 1.417
        return
    end
end



POS = zeros(length(0:.0000001:0.3803727),3)
for t1 = 0:.0000001:0.3803727;
    posn_f1 = f1(t1);
    %POS(t1* ??????????
end
display = [posn_f1;t1]; %used to find t value corresponding to y = 1.417
plot3(posn_f1(1,:),posn_f1(2,:),posn_f1(3,:));
xlabel('X'); ylabel('Y'); zlabel('Z')
title('Sportvision trajectory')
grid on
n = length(posn_f1(1,:));
final_posn = posn_f1(:,3803728);
final_posn

%%2016 pitch
pos2 = [-2.43;50;6.46];
vel2 = [9.46;-143.17;-9.15];
acc2 = [-23.08;34.2;-26.09];
f2 = @(t) pos2 + (t-t0).*vel2 + .5.*(t-t0).^2.*acc2;
t2 = [0:.0000001:0.3520677];
posn_f2 = f2(t2);
display = [posn_f2;t2]; %used to find t value
plot3(posn_f2(1,:),posn_f2(2,:),posn_f2(3,:));
xlabel('X'); ylabel('Y'); zlabel('Z')
title('Sportvision trajectory')
grid on
%%plot both pitches
hold on
plot3(posn_f1(1,:),posn_f1(2,:),posn_f1(3,:));
hold off
%%plot xy side to make sure they were both starting at y = 50
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