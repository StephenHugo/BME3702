function MSD = msdFunc(dx, dy)

    n = numel(dx); % number of elements in dx
    
    for tau = 1: n-1
        
        r=[];
        for step = 1: n - tau
            r(step) = sqrt(( dx(step + tau )- dx(step) ).^2 ...
                         + ( dy(step + tau ) - dy(step) ).^2);
        end
        
        MSD(tau) = mean(r);
 
    end
    
end