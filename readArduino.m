function out = getmotion

% create s, which is an open serial connection to the arduino
    s=serial('/dev/cu.usbmodem14201');
    set(s,'BaudRate',115200)
    set(s,'Timeout',0.2)
    set(s,'DataBits',8)
    set(s,'StopBits',1)
    
% open the serial connection
    fopen(s);
    pause(2)

    % send R to the arduino
    fprintf(s,'R');
    
    pause(0.4)
    % read out data from the arduino
    out = fscanf(s,'%f');
    % fread is another option to fscanf


% close the serial connection
    fclose(s);
    delete(s)

end