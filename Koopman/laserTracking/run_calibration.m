function [ output_args ] = run_calibration( vid , params )
%run_calibration: Called from labview, this function takes user through
%calibration process
%   Detailed explanation goes here

preview(vid);   % open window that shows the live feed from the camera

% Start the acquisition and create a new figure to display
% calibration results in a MATLAB SPY plot.
start(vid)
spyFig = figure;
hold on;

num = size(params.calPoints , 1);

acqResults = cell(1 , num);
xCalib = zeros(1 , num);
yCalib = zeros(1 , num);
for i = 1 : num
    hTarget.XData = params.calPoints(i,1);
    hTarget.YData = params.calPoints(i,2);
    
    disp(['Press any key to take Snapshot ', num2str(i) , ' of ' , num2str(num) , ' at (' , num2str(hTarget.XData) , ',' , num2str(hTarget.YData) , '):']);
    pause;
    sound(1), trigger(vid);
    acqResults{i} = getdata(vid, 1);
    
    [xCalib(i), yCalib(i), laserSights] = util_findlaser(acqResults{i});
    figure(spyFig);
    spy(laserSights)
    title(['Target ' , num2str(i) , ': Suspected Laser Sighting'])
end

% Close the SPY plot and stop the acquisition.
hold off;
close(spyFig)
stop(vid);

% check that the calibration points line up correctly
calibFig = figure;
for i = 1 : num
    % Target 1 results...
    subplot(2,ceil(num/2),i);
    util_plotpos(acqResults{i}, xCalib(i), yCalib(i));
end

% If calibration looks bad, return an error
satisfied = questdlg('Do the calibration results look good?');
close(calibFig);    % close the figure
if ~strcmp(satisfied , 'Yes')
    error('Calibration failed. Try Again.');
end

% define outputs
% calib.tform = fitgeotrans([xCalib(:) yCalib(:)], params.calPoints, 'projective');   % transform between camera and world coordinates
tform = cp2tform([xCalib(:) yCalib(:)], params.calPoints, 'projective');   % transform between camera and world coordinates

% close the video preview window
stoppreview(vid);
closepreview(vid);

end

