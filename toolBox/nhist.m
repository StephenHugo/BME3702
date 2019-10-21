function nhist(data, numBins)

% this simulates 10000 dice rolls of a four-sided die
% data = randi(sizeDice, numTrials, 1); % flat disribution

% generates a histogram with 20 bins
[barHeight, rollValue] = hist(data, numBins);

% add up all trials
sumHeights = sum(barHeight);

figure
% plot a new figure
bar(rollValue, barHeight/sumHeights)

title('normalized distribution')


end