function c = moreDiff(varargin)

    % Inspired by: https://scipython.com/book/chapter-7-matplotlib/examples/the-two-dimensional-diffusion-equation/

    % # simulation size, 10 mm square
    w = 10e-3;
    h = 10e-3;
    % # intervals in x-, y- directions, 1mm
    dx = 0.1e-3;
    dy = 0.1e-3;
    % # Diffusion coefficient of a protein, mm2.s-1
    D = 1.75e-10;

    Clow =1;
    Chigh = 1e3;

    nx = round(w/dx);
    ny = round(h/dy);

    dx2 = dx*dx;
    dy2 = dy*dy;
    % # Get a stable timestep, roughly = 14.25 s
    dt = dx2 * dy2 / (2 * D * (dx2 + dy2));

    c = zeros(nx, ny);
    if nargin ==1
        c0 = varargin{1};
        nopic = false;
    else
        nopic = true;
        c0 = Clow * ones(nx, ny);
            % # Initial conditions - ring of inner radius r, width dr centred at (cx,cy) (mm)
        r = 1.1e-3;
        cx = 5e-3; 
        cy = 5e-3;
        r2 = r^2;
        for i = 1:nx
            for j = 1:ny

                p2 = (i*dx-cx).^2 + (j*dy-cy).^2;

                if p2 < r2
                    c0(i,j) = Chigh;
                end

                if j<ny/2
                    c0(i,j) = Chigh;
                end
            end
        end
    end
    



    function do_timestep
    %     # Propagate with forward-difference in time, central-difference in space
        c = c0 + D * dt * ( ...
              conv2(c0,[1 -2 1],'same')/dx2 ...
              + conv2(c0,[1 -2 1]','same')/dy2 );

        c0 = c;
        if nopic
            for ii =1:nx
                for jj = 1:ny

                    p2 = (ii*dx-cx).^2 + (jj*dy-cy).^2;

    %                 if p2 < r2
    %                     c0(ii,jj) = Chigh;
    %                 end

                    if jj<ny/2
                        c0(ii,jj) = Chigh;
                    end
                end
            end
        end
    end


    % # Number of timesteps
    % # 253 timesteps to 1 hour, 6060 timesteps to 1 day
    nsteps = 250;

    % # Set up the image
    figure

    axis off

    for m = 1:nsteps
        do_timestep
        if mod(m,20)==0
            imagesc(c)
            zlim([0 1])
            pause(0.2)
        end
    end
end
