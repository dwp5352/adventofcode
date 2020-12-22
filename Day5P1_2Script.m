%% Code Advent Day 5 puzzle 1 & 2
clear;
clc;

Fid = fopen('C:\Users\dwp53\Desktop\Advent\Day 5\inputd5.txt');
templine = fgetl(Fid); % Read first line
SeatID = [];

% Determine Row
while ischar(templine)
    rStart = 0;
    cStart = 0;
    rEnd = 127;
    cEnd = 7;
    for ii = 1:7 % First six digits are F and B
        if ~isempty(regexp(templine(ii), 'F')) % Front Half
            rEnd = rStart + floor((rEnd-rStart)/2);
        else
            rStart = rEnd - floor((rEnd-rStart)/2);
        end
    end
    
    % Determine Col
    for ii = 8:10 % First six digits are F and B
        if ~isempty(regexp(templine(ii), 'L')) % Front Half
            cEnd = cStart + floor((cEnd-cStart)/2);
        else
            cStart = cEnd - floor((cEnd-cStart)/2);
        end
    end
    
    % Seat ID
    SeatID(end+1) = rStart*8+cStart;
    
    % Read next line
    templine = fgetl(Fid);
end
fclose(Fid)

Sanity = max(SeatID)

SortedSeats = sort(SeatID);
for ii = 1:length(SortedSeats)
    sub = SortedSeats(ii+1)-SortedSeats(ii);
    if sub > 1
        break;
    end
end

mySeat = SortedSeats(ii)+1;
