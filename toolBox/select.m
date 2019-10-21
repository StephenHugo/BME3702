function [out, pos] = select(in)

% This makes a figure and shows your image
figure, image( in ), colormap(gray)

% click the top left and bottom right corners of the crop region
pos = floor(ginput(2));

% assign that window as the output
out = in(pos(1,2):pos(2,2),pos(1,1):pos(2,1),:);

close
end