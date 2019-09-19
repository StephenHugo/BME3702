function [dxW, dyW] = diffSim( standardDev )
    
    windowSize = 1;
    delta = windowSize/100;
    noiz = 0;
    time = 1;
    
%     parseinputs
    
% 1.) Create and format a new figure window
    figure
    % choose a colormap
    % use set to specify the axes position to fill the fig window
    % turn the axes off
    
% 2.) Use the nhist function to understand the following lines
    % initial displacements for x and y
    dx = delta*(randi(3,time,1)-2); % negative moves to the right
    dy = delta*(randi(3,time,1)-2); % positive moves up
    
% 3.) Plot dx and dy to understand what the variables are
    dx = cumsum(dx); % add up individual steps
    dy = cumsum(dy); % stands for cumulative sum
    
% 4.) What is this code doing? Why are these the outputs?
    dxW = dx+(windowSize+1)/2;
    dyW = dy+(windowSize+1)/2;
    
    % used tabs for readability!!
    for t=1:time
        
% 5.) Read the following code and determine what is different from the
% original code contained in the fspecial function.

        %adapted from fspecial 'gaussian'
        siz   = ( windowSize - 1 ) /2; % specify window size
        std   = standardDev; % specify gaussian's standard deviation
    
        % create an x and y mesh with offset/displacement
        [x,y] = meshgrid( (-siz:siz) - dx(t), (-siz:siz) - dy(t)); 
        arg   = -(x.*x + y.*y)/(2*std*std);

        h     = exp(arg); % h is the gaussian bead
        h(h<eps*max(h(:))) = 0; % very small values set to 0

        h     = h/max(h(:)); % set max value in image to 1

% 6.) What is the role of noiz? Does it matter is it is negative?
        h     = h + noiz*randn( size(h) ); % adding noise
        
        imagesc(h) % overwrite the new image to the figure window
        
        title('simulated particle')
        
        hold on
        
        plot(dxW(t), dyW(t), 'rx', 'MarkerSize', 16, 'LineWidth', 3)
        
        hold off
    
        pause(0.04) % provide time for matlab to draw
    
    end
    
% 7.) What style of function is parseinputs? standard, nested or internal(local)
    function parseinputs
        % sets inputs to within a certain range
        
        % this is a conditional statement
        if time>100 % returns a boolean output
            time=100; % runs if the if condition is true
        elseif time<2 % this runs if the first condition fails: 0
            time=1; % runs if the elseif condition is true
        end 
        
        
        % limit windowSize value
        if windowSize>101
            windowSize = 100;
        elseif windowSize<10
            windowSize = 11;
        end
        
        % limit the noize value
        if abs(noiz)>5
            noiz=5; 
        end
        
    end
end