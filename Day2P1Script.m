%% Code Dvent Day 2 puzzle 1
clear;
clc;

% Open Text File
Fid = fopen('C:\Users\dwp53\Desktop\Advent\Day 2\input.txt');
Data = textscan(Fid, '%d %d %s %s');
fclose(Fid);

% Parse Data
min = Data{1};
max = abs(Data{2});
character = Data{3};
password = Data{4};

% Remove ':' from character string
character = cellfun(@(x) strrep(x,':', ''), character);

Valid = zeros(size(password));
for ii = 1:length(password)
    Compare = regexp(password{ii},character(ii))
    if length(Compare) >= min(ii) && length(Compare) <= max(ii)
        Valid(ii) = 1;
    end
end

Answer = sum(Valid)