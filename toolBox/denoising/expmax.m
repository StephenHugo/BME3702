function [stats,z,noiz,cell] = expmax(in)

    in = double(in);
    % this is the expectation maximization algorithm for 2 gaussians
    % sort data for smooth graphs
    [x,ind]   = sort(in(:));
    [~,ind]   = sort(ind);

    % initial guesses
    u1      = min(x);
    u2      = max(x);
    sig1    = std(x);
    sig2    = std(x);
    pih     = 0.1;
    limit   = 1;

    while limit>0.0001

        % get responsibilities
        gammai  = pih*dens(x,u2,sig2)./...
            ((1-pih)*dens(x,u1,sig1)+pih*dens(x,u2,sig2));

        % maximization step: weighted means/variances
        u1      = sum((1-gammai).*x)/sum(1-gammai);
        u2      = sum(gammai.*x)/sum(gammai);
        sig1    = sqrt( sum((1-gammai).*(x-u1).^2)/sum(1-gammai));
        sig2    = sqrt( sum(gammai.*(x-u2).^2)/sum(gammai));

        % convergence condition
        pihtemp = sum(gammai)/numel(gammai);
        limit   = abs(pih-pihtemp);
        pih     = pihtemp;

        d1      = dens(x,u1,sig1);
        d2      = dens(x,u2,sig2);
        % normalize density for display
        % you can comment the next 3 lines to make it run faster
%         plot(x,d1/max(d1),x,d2/max(d2))
%         hold on,plot(x,gammai,'black:'),hold off
%         pause(0.2)
    end

    thr=u1+2*sig1;
    stats     = [thr,u1,sig1,u2,sig2,pih];
    z=zeros(size(in));
    z(:)  = gammai(ind);
    
    noiz=zeros(size(in));
    noiz(:)=d1(ind)/max(d1);
    
    cell=zeros(size(in));
    cell(:)=d2(ind)/max(d2);
    
    figure,plot(x,d1/max(d1),x,d2/max(d2))
    hold on,plot(x,gammai,'black:')
    hold on,plot(ones(1,2)*thr,[0 1],'r:')

end

function out = dens(y,u,sig)
    % gaussian density function - can be any normalized distribution
    out = exp( -(y - u).^2/(2*sig^2) ) /(sqrt(2*pi)*sig);
end