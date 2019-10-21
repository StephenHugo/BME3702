function MSD = msdFunc(dx, dy)

    n = numel(dx); % number of elements in dx, could have also used dy
    
    for tau = 1: n-1 % time lag
        
        r=[]; % initiate empty r each new loop in tau
        
        for step = 1: n - tau % steps through the trajectory limited by tau
        
            r(step) = ( dx(step + tau ) - dx(step) ).^2 ...
                    + ( dy(step + tau ) - dy(step) ).^2;
                    % changed 9/28 by removing sqrt
        end
        
        MSD(tau) = mean(r); % mean SQUARED displacement, numel is n -1
 
    end
    
end
