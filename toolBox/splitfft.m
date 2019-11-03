function [mag, phs] = splitfft(input)
    
    % take the Fourier transform in 2D   
f=fft2(input);

% get the magnitude in frequency space
fm=abs(f);

% convert back to image space with just mag info
mag=fftshift(ifft2(log(fm)));

% get the phase in frequency space
fph=exp(1i*angle(f));

% convert back to image space
phs=abs(ifft2(fph));


end