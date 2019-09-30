%% Section 1
% press (cntr + enter) to run a section
x = 1;

y = int8(1);

z = uint8(1);
%% Section 2

max8bitvalue = 2^7+2^6+2^5+2^4+2^3+2^2+2+1

%% testing types of numbers

test1 = [x + 300, x/3 , x - 100 ]

test2 = [y + 300, y/3, y - 300 ]

test3 = [z + 300, z/3, z - 100 ]

%% Not just numbers

name = 'stephen'
favorite_color = 'blue'

matrix1 = [1 2; 3 4]
matrix2 = ones(3)

%% danger
x=1;
matrix1 = [1 2; 3 4];
x + matrix1
x./matrix1
% cast integers to double precision
double(y)./matrix1

%% the . operator

vec1 = [1 2 3]
vec2 = 3:5

% dot product
vec1 .* vec2

%% transpose  '
vec1'

vec1 * vec2' % vec2 is vertical
vec1' * vec2 % vec1 is vertical

%% calling specific elements

data = sin(1:56*pi);
data(end)
data(45:78)
data([1 7 end])

%% n dim variables
clc
cube= randn(2,2,2)
firstface = cube(:,:,1) % 3rd element is front/back
leftslice = cube(:,1,:) % 2nd dim is left/right slice
bottomrightfront = cube(2,2,1)