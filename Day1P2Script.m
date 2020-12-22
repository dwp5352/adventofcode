%% Code Dvent Day 1 puzzle 2
clear;
clc;
TempData = load('C:\Users\dwp53\Desktop\Advent\Day 1\Data.mat');
Data = TempData.Data;

Target = 2020;
Valid = cell(size(Data));

for ii = 1:length(Data)
    Add1 = Data(ii);
    for kk = ii+1:length(Data)
        Add2 = Data(kk);
        Sum = Add1+Add2;
        Add3 = Target - Sum;
        
        for zz = 1:length(Data)
            Valid{zz} = isequal(Add3, Data(zz));
        end
        temp = cell2mat(Valid);
        if sum(temp) > 0
            Answer = Add1*Add2*Add3
        end
    end
end

    
    
    

    