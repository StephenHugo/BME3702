function seeStack(stack)

figure
set(gca,'position',[0 0 1 1])
colormap(bone)

    for t=1:numel(stack)
        
        imagesc(stack(t).pic)
        pause(0.05)
        
    end
end