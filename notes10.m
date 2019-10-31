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

[z, pval] = colorSpace(a);
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

one = bwareaopen(b,15);
two = imfill(one,'holes');
three = imdilate(two,ones(3));
four = imerode(three,ones(3));
figure,imagesc([b four])

stats = regionprops(four,'Area','perimeter');







