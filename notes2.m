%% Create some data

x = 1:50;
y = x.^2 + -sin(1./x) + exp(0.03*x); % y(x)
% remember your dots!
z = y.*x; % z(x, y)

%% create a blank figure
figure
% close all
% closes all open windows
%% Plot the data

plot(x, y) % y vs. x
figure
plot(x, z) % z vs. x
% what do you expect to see?

%% Using subplots

subplot(3,1,1) % 1st suplot
plot(x, y) % y vs. x
subplot(3,1,2) % 2nd subplot
plot(x, z) % z vs. x

%% concatenate vectors

xx = [x; x];

yz = [y; z];

%% plot m x n matrices

plot(xx', yz','s')
% plot reads by column

%% using get and set

get(gcf) % get data on current figure

set(gcf, 'Color', [0.9    0.6   0.9 ])

%% using gca

get(gca) % get current axes

set(gca, 'Xscale', 'linear')
set(gca, 'FontSize', 24)

%% using gco

% first select something in a plot
set(gco, 'Color', 'black')
set(gco,'ydata', log(z))

%% using children of objects

plot(xx', yz' , 's')
ch = get(gca,'Children');
set(ch(1),'markersize',12)
set(ch(2),'markerfacecolor','g')

%% multiple lines on one graph

x= 0:pi/100:2*pi;
y=sin(x);
z=sin(x/2);

figure, plot(x,y,x,z)
title('back 2 back')

figure
plot(x,y+z)
% hold on
% plot(x,z)
title('hold on')

%% general advice
% cntr + R adds comment blocks
% cntr + T uncomments blocked comments

%% images

n = imread('nebula1.jpg');
b = imread('bird.jfif');

% three ways to display images
subplot(2,2,1)
image( b )  
title('image')  % 

subplot(2,2,2), imshow( n ) , title('imshow')  %

subplot(2,2,3), imagesc( n ) , title('imagesc') %

% be careful about the format of your images!
subplot(2,2,4), imagesc(sum(n,3)/3) , title('sum')

%% decrease resolution of image

n = n(1:5:end, 1:5:end, :);
imshow(n)

%% be careful about the format of your images!
sum1= sum(b,3)/3;
sum2= sum( double(b) ,3)/3;

figure, imagesc([sum1 sum2]) , title('sums')


