% 1.) Fix this function so that it will run the following code:
g = fspecial('gaussian',25,25/6);

function week3function

    fyi = 'Code inside functions should be tabbed once';
    
    for t = 1
        
        also = 'code inside loops/statements should get a tab as well';
        
        if ('you have' == 'multiple things happening')
           
            doing = 'it this way helps readability';
            
        end
        
        now = 'you can see this is out of the if loop but in the for loop';
        
    end
    
    finally = ['this code is out of the for loop,' ... 
               ' in the main body of the function.'];
    
% you can erase all this advice ^^ but try to follow it.

% 2.) Specify g as an output, then run the function from the command
% window by typing: >> gaus = week3function;
% Look at gaus using: >> imagesc(gaus)

% Even though gaus is different than g, remember that the workspace of the
% function is different than the global space. Matlab will take the data in
% g and save it as gaus.

% 3.) Specify 'size' as an input and replace the value 25 with 'size' (no
% quotes). Run this function from the command window with whatever size you
% choose. Can you break the function? What does gaus look like now?

% Once a function has inputs, you can no longer run it from the editor
% window by pressing the green arrow :( but you now have control over what
% values the function recieves as inputs! We will talk about parsing next
% week.

% 4.) Write a new function here called showGaus. It should create a new 
% figure containing an image of g as you have already done in the command 
% window. Call showGaus from within the main body of the week3function 
% code and run it again.

% showGaus is an example of a nested function. These can use the workspace
% of the function they reside in, but be careful that you don't overwrite
% something important. Nested functions cannot be called from outside the
% function!

end

% 5.) Write another new function called normG here. It should take g as
% an input, calculate the max value in g, divide each element of g by that
% max value, and finally return the result as an output.

% normG is an example of an internal function. Unlike nested functions, it
% has its own workspace so you can't borrow from the main function, but
% there is less danger of overwriting important variables. You can't call
% this from outside of th function, but you can call it within the main
% function and from other nester and internal functions withing
% week3function! Cool!

% 6.) Create yet another function called createNoise. It should take an
% amplitude as an input and the size of g, then return as output an array
% of randomly generated values to match g. Add this noise to g in the main
% code after showGaus runs, then call showGaus again to see the result.
% What values of amplitude make sense?

% 7.) Go into the fspecial function by typing >> edit fspecial
% Figure out where g comes from and pull out the code into week3function's
% main body instead of relying on fspecial. Can you create other types of
% outputs than just 'gaussian'? How is the 'gaussian' image different than
% a Gaussian probability distribution you might find on a histogram?


