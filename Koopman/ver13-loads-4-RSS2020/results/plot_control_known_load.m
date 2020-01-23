% plot_control_known_load
%   Creates plot of trajectory following for a known load from mpcData
%   files.
%   
%   Must first select mpcData files from file explorer (can select several 
%   simultaneously and it will display the different ones on a legend),
%   it generates a plot of that data, and you can save a cell array
%   containing all of (the paths to) the mpcData files you used.

% select data file(s)
[ datafile_name , datafile_path ] = uigetfile( 'C:\Users\danie\Google Drive\PhD\Research\Labview\RSS2020\Matlab\*.mat' , 'Choose data file(s)...' , 'multiselect' , 'on' );

% load in the data files
if iscell( datafile_name )  % check if it's cell array
    data_merged = cell( 1 , length(datafile_name) );
    for i = 1 : length(datafile_name)
        temp = load( [datafile_path , datafile_name{i}] );
        mpcData{i} = temp.mpcData;
    end
else    % if not a cell array, turn it into 1x1 cell array
    data_merged = cell(1,1);
    temp = load( [datafile_path , datafile_name] );
    mpcData{1} = temp.mpcData;
    disp('FYI, you only selected one file so your output cell array will have dimension 1.');
end

%% Reorder data in order of smallest to largest load

load = zeros( length(mpcData) , 2 );    % assumes 1-D load
temp = mpcData; % temporary copy of mpcData
for i = 1 : length( mpcData )
    load(i,:) = [ i , mpcData{i}.Wreal(3,end) ];
end
load_ordered = sortrows( load , 2 , 'ascend' );
for i = 1 : length( mpcData )
    mpcData{i} = temp{ load_ordered(i,1) };
end

%% Generate plot

% set the reference trajectory
ref = mpcData{1}.R;
zorigin = ref(3,:);
Tref = 20; % time trajectories should take. EDIT FOR FASTER TRAJECTORIES!!
kmin = 3;   % index of first values that arent trash
kmax = floor( Tref / mpcData{1}.model.params.Ts );  % number of steps to get to the end of the reference trajectory (assuming it never finishes late)

% initialze fields for legend
trials = gobjects( 3 , length(mpcData) + 1);
trialnames = cell( 1 , length(mpcData) + 1);
trialnames{1} = 'Reference';

% set axis limits
xbounds = [-175,175];
ybounds = [-175,175];
zbounds = [-50,150];

% set other plot parameters
espace = 0.01;  % extra space to add between subplots
dshift = -0.03;  % amount to shift down the projection plots
sparse_labels = { '' , -100 , '' , 0 , '' , 100 , ''};
sparse_labels_z = { '' , 0 , '' , 100 , '' };

% set line parameter values
lwidth = 2;   % line width to use for trajectories
rwidth = 2;     % line width to use for reference
lalpha = 0.8;   % opacity for trajectories

% create figure
figure;
set(gcf, 'Position',  [100, 100, 900 , 1125])
colormap lines;
clr = colormap;
clr_alpha = [ clr , 0.7 * ones(size(clr,1),1) ];  % same colors but with opacity
refclr = [1 1 1]*0.4;   % color for reference trajectory

smain = subplot(4,3,[1,2,3,4,5,6]); % 3d-plot
hold on;
trials(:,1) = plot3( ref(kmin:end,1) , ref(kmin:end,3) , ref(kmin:end,2) - zorigin , 'LineWidth' , 3 , 'Color' , refclr);
for i = 1 : length( mpcData )
    trials(:,i+1) = plot3( mpcData{i}.Y(kmin:end,7) , mpcData{i}.Y(kmin:end,9) , mpcData{i}.Y(kmin:end,8) - zorigin , 'LineWidth' , lwidth , 'Color' , clr_alpha(i,:));
    trialnames{i+1} = ['Actual ($w =$ ', num2str(mpcData{i}.Wreal(kmin,end)) , ' g)'];    % change to W
end
hold off;
grid on; box on;
view(-37.5+180,15);
set(smain,'Position', get(smain,'Position') + [0,-dshift,0,0]);    % move slightly up
xlim(xbounds); 
ylim(ybounds); 
zlim(zbounds); 
set(gca,'DataAspectRatio',[1 1 1])
legend( trials(1,:) , trialnames , 'Location' , 'northeast' , 'Interpreter' , 'Latex' );
xlh = xlabel('x (mm)');
ylh = ylabel('y (mm)');
zlh = zlabel('z (mm)');
xlh.Position = xlh.Position + [-60 , -20 , 0];    % change position of x-axis label
ylh.Position = ylh.Position + [-30 , -60 , 0];    % change position of y-axis label
xticks( [-150 , -100 , -50 , 0 , 50 , 100 , 150] );
xticklabels( sparse_labels );
yticks( [-150 , -100 , -50 , 0 , 50 , 100 , 150] );
yticklabels( sparse_labels );
zticklabels( sparse_labels_z );

sxz = subplot(4,3,8); % xz-projection
hold on;
plot( ref(kmin:end,1) , ref(kmin:end,2) - zorigin , 'LineWidth' , 3 , 'Color' , refclr);
for i = 1 : length( mpcData )
    plot( mpcData{i}.Y(kmin:end,7) , mpcData{i}.Y(kmin:end,8) - zorigin , 'LineWidth' , lwidth , 'Color' , clr_alpha(i,:));
end
hold off;
grid on; box on;
xlim(xbounds);
ylim(zbounds);
xticks( [-150 , -100 , -50 , 0 , 50 , 100 , 150] );
xticklabels( {[]} ); %( sparse_labels );
yticklabels( {[]} ); %( sparse_labels_z );
set(gca,'DataAspectRatio',[1 1 1])
title('xz-projection');
xlabel('x (mm)');
ylabel('z (mm)');
hxzp = get( gca, 'Position' );
% set(sxz,'Position', get(sxz,'Position') + [espace,dshift,0,0]);    % move slightly

sxy = subplot(4,3,7); % xy-projection
hold on;
plot( ref(kmin:end,1) , ref(kmin:end,3) , 'LineWidth' , 3 , 'Color' , refclr);
for i = 1 : length( mpcData )
    plot( mpcData{i}.Y(kmin:end,7) , mpcData{i}.Y(kmin:end,9) , 'LineWidth' , lwidth , 'Color' , clr_alpha(i,:));
end
hold off;
grid on; box on;
xlim(xbounds);
ylim(ybounds);
hxyp = get( gca, 'Position' );
% set( gca, 'Position', [hxyp(1:2) , hxzp(3) , hxzp(3)] );
% set(gca,'DataAspectRatio',[1 1 1])
xticks( [-150 , -100 , -50 , 0 , 50 , 100 , 150] );
xticklabels( {[]} ); %( sparse_labels );
yticks( [-150 , -100 , -50 , 0 , 50 , 100 , 150] );
yticklabels( {[]} ); %( sparse_labels );
title('xy-projection');
xlabel('x (mm)');
ylabel('y (mm)');
% set(sxy,'Position', get(sxy,'Position') + [espace,dshift,0,0.1]);    % move slightly

syz = subplot(4,3,9); % yz-projection
hold on;
plot( ref(kmin:end,3) , ref(kmin:end,2) - zorigin , 'LineWidth' , 3 , 'Color' , refclr);
for i = 1 : length( mpcData )
    plot( mpcData{i}.Y(kmin:end,9) , mpcData{i}.Y(kmin:end,8) - zorigin , 'LineWidth' , lwidth , 'Color' , clr_alpha(i,:));
end
hold off;
grid on; box on;
xlim(ybounds);
ylim(zbounds);
xticks( [-150 , -100 , -50 , 0 , 50 , 100 , 150] );
xticklabels( {[]} ); %( sparse_labels );
yticklabels( {[]} ); %( sparse_labels_z );
set(gca,'DataAspectRatio',[1 1 1])
title('yz-projection');
xlabel('y (mm)');
ylabel('z (mm)');
% set(syz,'Position', get(syz,'Position') + [espace,dshift,0,0]);    % move slightly

serr = subplot(4,3,[10,11,12]);  % error verses time
hold on;
% plot( ref(3:end,3) , ref(3:end,2) - zorigin , 'LineWidth' , 3 , 'Color' , refclr);
for i = 1 : length( mpcData )
    kmax_i = min( kmax , mpcData{i}.K(end) );
    time = mpcData{i}.T(kmin:kmax_i) - mpcData{i}.T(kmin);
    terror = sqrt( sum( ( mpcData{i}.Y(kmin:kmax_i,7:9) - ref(kmin:kmax_i,:) ).^2 , 2 ) );
    plot( time , terror , 'LineWidth' , lwidth , 'Color' , clr(i,:));
end
hold off;
grid on; box on;
set(serr,'Position', get(serr,'Position') + [0,dshift,0,0]);    % move slightly down
ylabel('Tracking error (mm)')
xlabel('Time (seconds)')
xlim([0,Tref]);   % for 130 second reference trajectory
ylim([0,150]);  % see if this works okay
title('Tracking Error')











