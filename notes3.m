%% homework data

T = [0:10 20:10:100]';
Vh2o = 1 + [0.0001329 ...
    0.0000733 ...
    0.0000321 ...
    0.0000078 ...
    0 ...
    0.0000081 ...
    0.0000318 ... % the three dots let you continue to the next line
    0.0000704 ...
    0.0001236 ...
    0.0001909 ...
    0.0002719 ...
    0.0015678 ...
    0.0043408 ...
    0.0078108 ...
    0.012074 ...
    0.017046 ...
    0.022694 ...
    0.028987 ...
    0.035904 ...
    0.043427]';

% plot the data, data vectors must be the same length to plot
plot(T, Vh2o, T([1 end]), Vh2o([1 end]),'--r'), grid on

title('Homework #1')
xlabel('Temperature (Celsius)')
ylabel('Volume H20 (cm^3)')

% the syntax T([1 end]) returns only the first and last data point in T
% '--r' tells the plot function to make a dashed red line

%% zooming in on interesting data

xlim([0 10]) % zoom to 0 - 10 degrees
ylim([1 1.0005]) % zoom to a reasonable range of specific volume data
% you should see that there are two temperatures that correspond to
% the same volume of water. It is not thermometric.

%% histograms

% Let's create some random data points
data = rand(1e4,1); % 10,000 points as a column
data2 = randn(1e4,1); % same size data but different random function
data3 = randi(6,1e4,1); % 10k values from the integers from 1 to 6

% histograms put values of data into bins so you can see how data is
% distributed.
hist(data, 20) % this looks like a uniform distribution [0, 1]
figure, hist(data2, 20) % this data is normally distributed, mean=0 std=1
figure, hist(data3, 20) % this is also uniform

%% functions

% We don't always want to type commands multiple times when working.
% Writing a function let's you re-use code you've written before, and it's
% a bit more powerful than a simple script in many ways. The commented code
% below would normalize the data so that the y-axis in our histograms
% relate to the probability of randomly selecting a value in a bin from the
% dataset.

% This will not run if you un-comment it in this notes script!!

% function nhist(data, numBins)
% 
% % this simulates 10000 dice rolls of a four-sided die
% % data = randi(sizeDice, numTrials, 1); % flat disribution
% 
% % generates a histogram with 20 bins
% [barHeight, rollValue] = hist(data, numBins);
% 
% % add up all trials
% sumHeights = sum(barHeight);
% 
% figure
% % plot a new figure
% bar(rollValue, barHeight/sumHeights)
% 
% title('normalized distribution')
% 
% 
% end

%% feautres of functions

% functions always start with the word 'function'. If your function has
% outputs, they are specified in brackets, followed by the filename (also
% the function name when calling it), then followed by inputs within 
% (parentheses). 

% function [output] = functionName(input)

%% Calling a function

% Calling a function just means you type it in your code to use it. In
% matlab, you can call functions from the command window or within other
% functions and scripts. Think of it like copying and pasting pre-written
% code from another place into the line where you call your function to
% achieve some purpose. For example, if you call nhist from the command
% window, it runs everything in the file without having to type anything
% new! 

% When running a function, matlab creates its own workspace for variables
% that is different than the global workspace that scripts use. This
% protects certain variables from getting overwritten and also keeps your
% global workspace cleaner.

%% debugging

% you can pause code written in scripts and functions by clicking the line
% hyphen next to the code
% <--- over here!
x = 'this is just an example'; 
% when you run this section of the script, Matlab will stop BEFORE line 115
% and you can inspect the current workspace to check on problems. Hitting
% F5 in windows continues running the code until another breakpoint or
% completion. shift + F5 cancels debugging.

% It works the same way in functions.

% Now, open up the week3function and follow the directions!
