vec = [1 1 0; ...
       0 0 0];

theta = 2*pi/50;
Ry = [cos(theta) 0 sin(theta); ...
     0           1          0;...
     -sin(theta)  0 cos(theta)];
Rx = [cos(theta) -sin(theta) 0; ...
     sin(theta) cos(theta) 0;...
     0 0 1];

for t = 1:50
    
    vec = vec*Ry*Rx;
    plot3(vec(:,1), vec(:,2), vec(:,3), 'b')
    xlim([-1.1 1.1])
    ylim([-1.1 1.1])
    hold on
    pause(0.25)
end