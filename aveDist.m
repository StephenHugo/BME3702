function d = aveDist(xy)

    for t=1:length(xy)
        
        d(:,t) = sqrt((xy(:,1)-xy(t,1)).^2+(xy(:,2)-xy(t,2)).^2);
    end
    
end