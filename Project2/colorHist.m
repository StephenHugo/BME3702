function [intensity, Th, Rh, v] = colorHist(in)
    
    % This rotates the pixel colors to decouple intensity
    [v, v2] = colorRot(in);
    
    z = zeros(size(in(:,:,1)));
    
    z(:) = v2(:,3);
    intensity = z;
    
    % convert color wheel to polar coords
    [theta, rho] = cart2pol(v2(:,1),v2(:,2));
    theta(theta<0) = theta(theta<0) + 2*pi;
    z(:)=theta;
    Th = z;
    
    z(:)=rho;
    Rh = z;
    
    % This is the distribution on the color wheel
    nhist(theta, 20)
    title('Color Distribution')
    xlabel('Theta')
    set(gca,'xtickLabel',{'0' 'Green' '2' 'Blue' '4' 'Red'})
    
    % This is the departure from grey to full color
    nhist(rho, 20)
    title('Saturation')
    xlabel('Rho')
    
end