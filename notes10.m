%% load the image

a = imread('glee.jpg');

%% convert to double precision

a = double(a);

%% crop a region

a =select(a);

%% see color image

figure, imshow(uint8(a))
set(gca,'position',[0 0 1 1])
set(gcf,'position',[387  305  320  260])

%% use colorSpace

z = colorSpace(a);
set(gcf,'position',[387  305  320  260])


%% see greyscle image
% 
% figure, imagesc(sum(a,3))
% colormap(bone.*summer)
% title('greyscale')
% axis off
% set(gca,'position',[0 0 1 1])
% set(gcf,'position',[387  305  320  260])

%%
b = z<50; % must set thr

  one = b - bwareaopen(b,150); % threshold objects by size (area)
  two = imfill(one,'holes'); % fill in holes for binary images
%   three = imdilate(two,ones(5));
%   berode = imerode(three,ones(5));
% figure,imagesc([two.*z ])

for t=1:3
    a(:,:,t) = a(:,:,t).*two;
end

figure,imshow(uint8(a))
% stats = regionprops(four,'Area','perimeter');







