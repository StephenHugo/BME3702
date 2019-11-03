function dispColor(in)

    pic = uint8(in);
    figure
    imshow(pic)
    axis off
    set(gca,'position',[0 0 1 1])
%     set(gcf,'position',get(gcf,'position')/2)
    
end