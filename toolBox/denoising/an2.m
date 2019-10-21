function out = an2(in,sw,iterations)
% K controls the anisotropic weight
% lambda controls the diffusion speed
% shift takes the gradient at different distances

forK = in([1 end]);
K           = 2*std(forK);

lambda      = 1;
shift       = 1;

    for t=1:iterations
        in =  in + lambda*( getsum(in,K,shift,sw) )/4;

    end
out = in;
end

function z = getsum(in,K,shift,sw)
% cardinal direction in picture array

nswe=[shift 0;-shift 0;0 shift;0 -shift];
z=zeros(size(in));
    for t=1:4  
%         easy gradient
        ag = circshift(in,nswe(t,:))-in;
        switch sw
            
            case 1
%         weight promotes fat edges, Lorenztian
        z = z + 0.5*ag./(1+(abs(ag)/K).^2);
            
            case 2
%         weight promotes higher contrast, Leclerc
        z = z + 0.5*ag./(2*exp((abs(ag)/K).^2)/exp(1));
            
            case 3
%         Tukey's Biweight 
        z = z + 0.5*ag.*(1-(min(abs(ag),K)/K).^2).^2;
        end
    end
end