%% Code Dvent Day 3 puzzle 2
clear;
clc;

rowidx = [1 1 1 1 2]
colidx = [1 3 5 7 1];

Pos = colidx + 1;
Answer = 1;
for cntr = 1:length(colidx)
    treecntr = 0;
    Fid = fopen('C:\Users\dwp53\Desktop\Advent\Day 3\inputd3.txt');
    templine = fgetl(Fid); % Read first line
    treecntr = 0;
    % Open Text File
    while ischar(templine)
        for ii = 1:rowidx(cntr)
            templine = fgetl(Fid); % Move down 1 line
            if ~ischar(templine)
                break;
            end
        end
        if ~ischar(templine)
            break;
        end
        Symbol = templine(Pos(cntr)); % Read the character
        ValidValue = strcmp(Symbol, '#');
        if ValidValue
            treecntr = treecntr + 1;
        end
        Pos(cntr) = Pos(cntr)+colidx(cntr);
        if Pos(cntr) > 31
            Pos(cntr) = Pos(cntr)-31;
        end
    end
    fclose(Fid);
    Answer = Answer*treecntr;
end


