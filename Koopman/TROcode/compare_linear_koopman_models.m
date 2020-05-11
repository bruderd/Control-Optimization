function err = compare_linear_koopman_models( numModels , data )
%compare_linear_koopman+models: Compares the performance of 'numModels' koopman 
%   models for soft robot system.

% If data argument not supplied, prompt uset to load data from file
if ~exist('data', 'var')
    % Prompt user to identify data file
    [data_file,data_path] = uigetfile('dataFiles\*.mat' , 'Choose a validation data file');
    all_data = load([data_path, data_file]); % must be a .mat file
    data = all_data.val;    % isolate just the validation data trials
end

%% load in the koopman models

ksys = cell( 1 , numModels );   % model classes
koop = cell( 1 , numModels );   % for storing results
for i = 1 : numModels
    [data_file,data_path] = uigetfile('systems\fromData\*.mat' , 'Choose a model file');
    matcontents = load([data_path,data_file]);
    ksys{i} = matcontents.sysid_class;
    koop{i}.res = cell( size(data) );   % field to save results of each validation trial
end

%% simulate linear Koopman models

% load in the linear koopman model
Ts = ksys{1}.params.Ts;   % timestep

% % (OPTIONAL) Resample the data coming in (should remove if not needed)
% for i = 1 : length( data )
%     tq = ( data{i}.t(1) : Ts : data{i}.t(end) )';
%     data{i}.u = interp1( data{i}.t , data{i}.u , tq );
%     data{i}.y = interp1( data{i}.t , data{i}.y , tq );
%     data{i}.t = tq;
% end

for j = 1 : numModels
    for i = 1 : length(data)
        koop{j}.res{i}.t = data{i}.t;
        
        % scale down the data
        datasc.t = data{i}.t;
        datasc.u = ksys{j}.scaledown.u( data{i}.u );
        datasc.y = ksys{j}.scaledown.y( data{i}.y );
        
        [~,koop{j}.res{i}.zeta] = ksys{j}.get_zeta( datasc );
        koop{j}.res{i}.z = zeros( length(koop{j}.res{i}.t) , length( ksys{j}.basis.full ) );   % preallocate
        koop{j}.res{i}.z(1,:) = ksys{j}.lift.full( koop{j}.res{i}.zeta(1,:)' )'; % initial value
        koop{j}.res{i}.y = zeros( size( data{i}.y ) );  % preallocate
        koop{j}.res{i}.y(1,:) = datasc.y(1,:);  % initial value
        
        % simulate the (scaled) system
        for k = 1 : length( koop{j}.res{i}.t ) - 1
            koop{j}.res{i}.z(k+1,:) = ( ksys{j}.model.A * koop{j}.res{i}.z(k,:)' + ksys{j}.model.B * datasc.u(k,:)' )';
            koop{j}.res{i}.y(k+1,:) = ( ksys{j}.model.C * koop{j}.res{i}.z(k+1,:)' )';
        end
        
        % scale data back up
        koop{j}.res{i}.u = data{i}.u;
        koop{j}.res{i}.y = ksys{j}.scaleup.y( koop{j}.res{i}.y );
        
        % distance error at each timestep
        koop{j}.res{i}.err = sqrt( sum( ( data{i}.y - koop{j}.res{i}.y ).^2 , 2 ) );
    end
end


%% evaluate the total average error for each model

% sum the error from all the trials
koop_allerr = cell( 1 , numModels );

for j = 1 : numModels
    koop_allerr{j} = [];
    for i = 1 : length( data )
        % concatenate all the error vectors
        koop_allerr{j} = [ koop_allerr{j} ; koop{j}.res{i}.err ];
    end
end

% calculate average error for each model
err.ave = zeros( numModels , 1 );
err.std = zeros( numModels , 1 );
for j = 1 : numModels
    totsteps = size( koop_allerr{j} , 1 );
    err.ave(j) = sum( koop_allerr{j} ) / totsteps;
    
    % calculate standard deviation
    err.std(j) = std( koop_allerr{j} );
end


%% plot the error comparison over all validation trials

% Define custom colors:
cb(1,:) = [69,117,180]/255;
cb(2,:) = [145,191,219]/255;
cb(3,:) = [254,224,144]/255;
cb(4,:) = [252,141,89]/255;
cb(5,:) = [215,48,39]/255;

% Define more colors
cb_red = [228,26,28] ./ 255;   % red (for linear state space)
cb_blue = [55,126,184] ./ 255;  % blue (for linear koopman)
cb_orange = [255,127,0] ./ 255;   % orange (for nonlinear koopman)
cb_grey = [124,124,124] ./ 255;

% bar chart showing TOTAL NRMSE across all states and all trials
figure
hold on
bar(1 , err.kooplin.ave * 2.54 , 'FaceColor' , cb_blue );
bar(2 , err.lin.ave * 2.54 , 'FaceColor' , cb_red );
bar(3 , err.koop.ave * 2.54 , 'FaceColor' , cb_orange );
bar(4 , err.nnet.ave * 2.54 , 'FaceColor' , cb_grey );
bar(5 , err.nlarx.ave * 2.54 , 'FaceColor' , cb_grey );
bar(6 , err.nlhw.ave * 2.54 , 'FaceColor' , cb_grey );
xticks(1:6);
xtickangle(45);
xticklabels( {'Koopman (Linear)', 'State Space (Linear)' , 'Koopman (Nonlinear)' , 'Neural Network', 'NLARX', 'Ham.-Wiener'} );
ylabel('Average Error (cm)');
ylim([0 12]);
% eb = errorbar(1:numSystems-1, [mean_NRMSE_alltrials(1:3)' * 100, mean_NRMSE_alltrials(5:end)' * 100], [std_NRMSE_alltrials(1:3)' * 100, std_NRMSE_alltrials(5:end)' * 100], '.', 'CapSize', 14, 'LineWidth', 1.5, 'Color', 'k');
eb = errorbar(1:6, [err.kooplin.ave , err.lin.ave , err.koop.ave , err.nnet.ave , err.nlarx.ave , err.nlhw.ave] * 2.54, [err.kooplin.std , err.lin.std , err.koop.std , err.nnet.std , err.nlarx.std , err.nlhw.std] * 2.54, '.', 'CapSize', 14, 'LineWidth', 1.5, 'Color', 'k');
box on
hold off


%% plot the error comparison over all validation trials (excluding NLARX and Hamm-Weiner)

% Define custom colors:
cb(1,:) = [69,117,180]/255;
cb(2,:) = [145,191,219]/255;
cb(3,:) = [254,224,144]/255;
cb(4,:) = [252,141,89]/255;
cb(5,:) = [215,48,39]/255;

% Define more colors
cb_red = [228,26,28] ./ 255;   % red (for linear state space)
cb_blue = [55,126,184] ./ 255;  % blue (for linear koopman)
cb_orange = [255,127,0] ./ 255;   % orange (for nonlinear koopman)
cb_grey = [150,150,150] ./ 255;

% bar chart showing TOTAL NRMSE across all states and all trials
figure
hold on
bar(1 , err.kooplin.ave * 2.54 , 'FaceColor' , cb_blue );
bar(2 , err.lin.ave * 2.54 , 'FaceColor' , cb_red );
bar(4 , err.koop.ave * 2.54 , 'FaceColor' , cb_orange );
bar(5 , err.nnet.ave * 2.54 , 'FaceColor' , cb_grey );
xticks([0.85 1.15 2 3.85 4.15 5]);
xtickangle(45);
xticklabels( {'Koopman' , '(Linear)     ' , 'State Space' , 'Koopman' , '(Nonlinear)   ' , 'Neural Network'} );
ylabel('Average Error (cm)');
ylim([0 4]);
% eb = errorbar(1:numSystems-1, [mean_NRMSE_alltrials(1:3)' * 100, mean_NRMSE_alltrials(5:end)' * 100], [std_NRMSE_alltrials(1:3)' * 100, std_NRMSE_alltrials(5:end)' * 100], '.', 'CapSize', 14, 'LineWidth', 1.5, 'Color', 'k');
eb = errorbar([1 2 4 5], [err.kooplin.ave , err.lin.ave , err.koop.ave , err.nnet.ave] * 2.54, [err.kooplin.std , err.lin.std , err.koop.std , err.nnet.std] * 2.54, '.', 'CapSize', 14, 'LineWidth', 1.5, 'Color', 'k');
box on;
set(gca, 'YGrid', 'on', 'XGrid', 'off');
hold off