%% Code Dvent Day 3 puzzle 1
clear;
clc;


Idx = 4;

Fid = fopen('C:\Users\dwp53\Desktop\Advent\Day 3\inputd3.txt');
templine = fgetl(Fid); % Read first line
treecntr = 0;
% Open Text File
while ischar(templine)
    templine = fgetl(Fid); % Move down 1 line
    if ~ischar(templine)
        break;
    end
    Symbol = templine(Idx); % Read the character
    ValidValue = strcmp(Symbol, '#');
    if ValidValue
        treecntr = treecntr + 1;
    end
    Idx = Idx+3;
    if Idx > 31
        Idx = Idx-31;
    end
end
fclose(Fid);

