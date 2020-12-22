%% Code Dvent Day 2 puzzle 2
clear;
clc;

% Open Text File
Fid = fopen('C:\Users\dwp53\Desktop\Advent\Day 2\input.txt');
Data = textscan(Fid, '%d %d %s %s');
fclose(Fid);

% Parse Data
Pos1 = Data{1};
Pos2 = abs(Data{2});
character = Data{3};
password = Data{4};

% Remove ':' from character string
character = cellfun(@(x) strrep(x,':', ''), character);

Valid = zeros(size(password));
for ii = 1:length(password)
    Compare = regexp(password{ii},character(ii))
    Pos1Idx = find(Pos1(ii) == Compare);
    Pos2Idx = find(Pos2(ii) == Compare);
    if (~isempty(Pos1Idx) && isempty(Pos2Idx)) ||(isempty(Pos1Idx) && ~isempty(Pos2Idx)) 
        Valid(ii) = 1;
    end
end

Answer = sum(Valid)