% Load in test data and do stuff with it
clear
load('testData\testData_2.mat')

FMraw = SyncFT.data;

% Remove the sensor offset at (0,0) and remedy sign discrepency
FM = zeros(size(FMraw));
for i = 1:4
    FM(125*(i-1)+1 : 125*i, 1) = -2 * ( FMraw(125*(i-1)+1 : 125*i, 1) - FMraw(125*(i-1)+1, 1) );
    FM(125*(i-1)+1 : 125*i, 2) = FMraw(125*(i-1)+1 : 125*i, 2) - FMraw(125*(i-1)+1, 2);
end

% Separate data by configuration
FM1 = FM(1:125,:);
FM2 = FM(126:250,:);
FM3 = FM(251:375,:);
FM4 = FM(376:500,:);