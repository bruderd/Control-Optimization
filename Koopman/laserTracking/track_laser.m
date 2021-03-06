function laser = track_laser(vid, calib , params)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% pull out x and y from calib struct
xCalib = calib.x;
yCalib = calib.y;

laser = struct;
laser.x = [];
laser.y = [];
start(vid)

disp('Press any key to start tracking');
pause;

FS = stoploop({'Stop tracking laser'});     % define keyboard interrupt
i = 0;
while ~FS.Stop()
    i = i + 1; % increment counter
    
    % Acquire an image frame and determine the
    % camera pixel coordinates.
    sound(1), trigger(vid);
    frame = getdata(vid, 1);
    [x, y] = util_findlaser(frame);

    if ~isnan(x) && ~isnan(y)
%         % If coordinates were valid, ensure the camera pixel coordinate
%         % was in the calibration range.
%         x = max([x min(xCalib([1 2]))]);
%         x = min([x max(xCalib([3 4]))]);
%         y = min([y max(yCalib([1 4]))]);
%         y = max([y min(yCalib([2 3]))]);

        % Determine spatial transformation from the unit square calibration points.
        tform = calib.tform;
        xyScreen = tformfwd([x, y], tform);
        xScreen = xyScreen(1);
        yScreen = xyScreen(2);

%         % Ensure the new coordinates remain within the unit square.
%         xScreen = min([xScreen 1]);
%         xScreen = max([xScreen 0]);
%         yScreen = min([yScreen 1]);
%         yScreen = max([yScreen 0]);

        % Store the new MATLAB axis coordinates.
        laser.x = [laser.x(:); xScreen];
        laser.y = [laser.y(:); yScreen];
    end
end

FS.Clear() ;  % Clear up the box
clear FS ;    % this structure has no use anymore
stop(vid)



end

