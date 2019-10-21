function [vec, vec2] = colorRot(in)

    step = 1;    

    % separate out all the color channels
    r = in(1:step:end,1:step:end,1);
    g = in(1:step:end,1:step:end,2);
    b = in(1:step:end,1:step:end,3);
    
    vec = [r(:) g(:) b(:)] /255;
    
    theta = pi/4;
    Rx = [cos(theta) -sin(theta) 0; ...
         sin(theta) cos(theta) 0;...
         0 0 1];
     
    theta = atan(sqrt(2));
    Ry = [cos(theta) 0 sin(theta); ...
         0           1          0;...
         -sin(theta)  0 cos(theta)];
     
    vec2 = vec*Rx*Ry;
    
%     hold on
%     for t=1:numel(r)
% 
%         plot3(vec2(t,1), vec2(t,2), vec2(t,3),'o', ...
%             'color','none',...
%             'markerfacecolor',vec(t,:))
%         xlim([-1.1 1.1]*sqrt(3)/2)
%         ylim([-1.1 1.1]*sqrt(3)/2)
%         zlim([-0.1 sqrt(3.1)])
%         
%         pause(0.02)
%         
%     end

end