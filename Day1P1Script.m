%% Code Advent Day 1 puzzle 1
clear;
clc;
TempData = load('C:\Users\dwp53\Desktop\Advent\Day 1\Data.mat');
Data = TempData.Data;

Target = 2020;
Valid = cell(size(Data));
for ii = 1:length(Data)
    Value = Target - Data(ii);
    for zz = 1:length(Data)
        Valid{zz} = isequal(Value, Data(zz));
    end
    temp = cell2mat(Valid);
    if sum(temp) > 0
        Answer = Value*Data(ii)
    end
    
end

