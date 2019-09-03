%% Create some data

x = 1:50;
y = x^2 + exp(0.03*x);
z = y*x;

%% create a blank figure
figure

%% Plot the data

plot(x, y) % y vs. x

plot(x, z) % z vs. x
% what do you expect to see?

%% concatenate vectors

xx = [x; x];

yz = [y; z];

%% plot m x n matrices

plot(xx, yz)
% is this correct?

%% images

%% histograms

