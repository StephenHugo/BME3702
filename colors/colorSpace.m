function colorSpace(a)

    step=1;
    
    % separate out all the color channels
    r = a(1:step:end,1:step:end,1);
    g = a(1:step:end,1:step:end,2);
    b = a(1:step:end,1:step:end,3);
    
    figure
    % show the image
    image(uint8(a))
    % have a user click on an object they want to segment
    pos=round(ginput(1));
    close
    % get the color of that pixel
    pixelVal = a(pos(2),pos(1),:);
    
    % subtract that value from every pixel, get magnitude of that vector
    q=sqrt( (r(:)-pixelVal(1)).^2 + ...
            (g(:)-pixelVal(2)).^2 + ...
            (b(:)-pixelVal(3)).^2 );
    
    nhist(q,15)
    z=zeros(size(r(:,:,1)));
    
    % anything within thr arbitrary units of intensity shows up
    thr = 50;
    z(q<thr)=1;
    
    % check the result
    figure,imagesc(z),colormap(bone),axis off,set(gca,'position',[0 0 1 1])


end