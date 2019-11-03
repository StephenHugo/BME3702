% 5 points in total, be flexible with student variations

% 1 point for correct title and labeled axes
% title('student name')
% xlabel('Radians')
% ylabel('Amplitude')


% 1 point for big bold letters
hxl = get( gca, 'xlabel');
set(hxl, 'fontweight' , 'bold' , ...
    'fontsize' , 18)

hyl = get( gca, 'ylabel');
set(hyl, 'fontweight' , 'bold' , ...
    'fontsize' , 18)

htl = get( gca, 'title');
set(htl, 'fontweight' , 'bold' , ...
    'fontsize' , 18)

% 1 point for using fondobj correctly to make thick lines

f = findobj('linewidth',0.5);
set(f, 'linewidth', 2)

% 1 point for the correct axes attributes
set(gca, 'linewidth', 1.5, ...
    'fontsize', 18, ...
    'ticklength', [0.03 0.025], ...
    'tickdir', 'out')

% 1 point for the correct figure attributes
box off, grid on

set(gcf, 'position', [200 200 440 330], ...
    'color', [1 1 1])

% unless they are way off, assign a 4/5 for persistent mistakes and 3/5 for ommissions
