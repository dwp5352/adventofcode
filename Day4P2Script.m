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
            tempIdx = cellfun(@(x) ~isempty(x), Hdrs);
            if sum(tempIdx) >= 1
                didPass = checkValidity(Masterlist{ii}, Data{tempIdx});
                if didPass
                    pass = pass+1;
                end
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

function didPass = checkValidity(Hdr, Data)

if strcmp(Hdr, 'byr')
    Date = regexp(Data,'(?<=byr:)\d*','match');
    Date = str2num(Date{1});
    if Date >= 1920 && Date <= 2020
        didPass = 1;
    else
        didPass = 0;
    end
    
    
elseif strcmp(Hdr, 'iyr')
    Date = regexp(Data,'(?<=iyr:)\d*','match');
    Date = str2num(Date{1});
    if Date >= 2010 && Date <= 2020
        didPass = 1;
    else
        didPass = 0;
    end
    
    
elseif strcmp(Hdr, 'eyr')
    Date = regexp(Data,'(?<=eyr:)\d*','match');
    Date = str2num(Date{1});
    if Date >= 2020 && Date <= 2030
        didPass = 1;
    else
        didPass = 0;
    end
    
elseif strcmp(Hdr, 'hgt')
    number = regexp(Data,'(?<=hgt:)\d*','match');
    number = str2num(number{1});
    unit = regexp(Data,'(?<=hgt:)\w*','match');
    
    if ~isempty(regexp(unit{1}, 'cm'))
        if number >= 150 && number <= 193
            didPass = 1;
        else
            didPass = 0;
        end
        
    elseif ~isempty(regexp(unit{1}, 'in'))
        if number >= 59 && number <= 76
            didPass = 1;
        else
            didPass = 0;
        end
    else
        didPass = 0;
    end
    
elseif strcmp(Hdr, 'hcl')
    color = regexp(Data,'(?<=hcl:#)\w*','match');
    if ~isempty(color)
        if length(color{1}) == 6
            didPass = 1;
        else
            didPass = 0;
        end
    else
        didPass = 0;
    end
elseif strcmp(Hdr, 'ecl')
    MasterColorList = {'amb', 'blu', 'brn', 'gry', 'grn', 'hzl' 'oth'};
    color = regexp(Data,'(?<=ecl:)\w*','match');
    if ismember(color, MasterColorList)
        didPass = 1;
    else
        didPass = 0;
    end
elseif strcmp(Hdr, 'pid')
    num = regexp(Data,'(?<=pid:)\d*','match');
    if ~isempty(num)
        if length(num{1}) == 9 %
            didPass = 1;
        else
            didPass = 0;
        end
    else
        didPass = 0;
    end
end
end