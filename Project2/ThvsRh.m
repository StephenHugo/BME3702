function ThvsRh(in)
    
    step = 10^(floor(log10(numel(in)/3))-3);
    [I, Th, Rh, v] = colorHist(in);
    close
    
    plot(0)
    hold on
    for t=1:step:length(v)
        
        plot(Rh(t),Th(t),'o',...
            'MarkerFaceColor',v(t,:),...
            'MarkerEdgeColor','none')
        ylim([0 2*pi])
        pause(0.02)
        
    end
    title('Color vs. Saturation')
    xlabel('Saturation')
    ylabel('Color')
    hw1rubric

end