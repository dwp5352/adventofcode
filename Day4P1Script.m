%% Code Dvent Day 3 puzzle 2
clear;
clc;

Fid = fopen('C:\Users\dwp53\Desktop\Advent\Day 4\input.txt');
templine = 'start';
Masterlist = {'byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'}; %'Cid' does not matter
Data = {};
GoodPass = 0;
cntr = 1;

while ischar(templine)
    templine = fgetl(Fid); % Read first line
    Data{cntr} = templine;
    cntr = cntr+1;  
    if isempty(templine) || length(templine) == 1 % Need length ==1 to deal with final line
        pass = 0;
        fail = 0;
        if length(templine) == 1
            Data = Data(:,end-1);
        end
        for ii = 1:length(Masterlist)
            Hdrs = cellfun(@(x) {regexp(x, Masterlist{ii})}, Data);
            Valid = cellfun(@(x) ~isempty(x), Hdrs);
            if sum(Valid) >= 1
                pass = pass+1;
            else
                fail = fail+1;
            end
        end
        
        if pass == length(Masterlist)
            GoodPass = GoodPass + 1;
        end
        
        % Reset Data Read in
        Data = {};
        cntr = 1;
    end
end

fclose(Fid);

