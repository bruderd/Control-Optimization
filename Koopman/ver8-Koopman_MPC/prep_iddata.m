function [zsysid_merged, zval_merged, zsysid, zval] = prep_iddata( data )
%prep_iddata: prepares data to be used with Matlab System Identification
%Toolbox
%   Detailed explanation goes here
%
%   INPUTS:
%       data is a struct containing all of the experimental data for the
%       systm. For more information see functions such as gen_data_fromSim
%
%   OUTPUTS:
%       zmerged is an iddata object containing the merged data from all
%       experements
%
%       zval is an iddata object containing tht data from the validation
%       experiment
%
%       zall is a struct containing the individual data from each
%       experiment. Each experiment can be accessed zall.z#, where # is the
%       experiment's identification number
%
%%
zsysid = struct;
zval = struct;

% calculate the actual total numner of trials
% num = round(sqrt(data.valparams.numTrials));
% numTrials = num^2;    % ONLY USED FOR SIMULATED VIRTUAL SYSTEMS (also should change that...)
numTrials = data.valparams.numTrials;
numVals = data.valparams.numVals;
nd = data.valparams.nd;     % number of delays in model

%% create iddata objects for sysid trials

% initialize merged dataset
zsysid.z1 = iddata(data.trial1.y(nd+1 : end , :), data.trial1.u(nd+1 : end , :), data.valparams.Ts);
% zsysid_merged = zsysid.z1;

% create iddata objects for all trials
for i = 2 : numTrials
   trialID = ['trial', num2str(i)];
   trialName = data.(trialID);
   
   expID = ['z', num2str(i)];
   zsysid.(expID) = iddata(trialName.y(nd+1 : end , :), trialName.u(nd+1 : end , :), data.valparams.Ts);
   
%    % merge all of the data sets into single multiexperiment object (THIS IS BAD BECAUSE IT MAKES THE SYSID TRAINING DATA UNSCALED FOR THE LINEAR SYSTEM)
%    zsysid_merged = merge( zsysid_merged, zsysid.(expID) );
end

%% create merged iddata object (THIS ENSURES THE SYSID DATA IS SCALED PROPERLY)
zsysid_merged = iddata(data.alltrials.x(nd+1 : end , :), data.alltrials.u(nd+1 : end , :), data.valparams.Ts);

%% create iddata objects for validation trials

% initialize merged dataset
zval.z1 = iddata(data.val1.y(nd+1 : end , :), data.val1.u(nd+1 : end , :), data.valparams.Ts);
zval_merged = zval.z1;

% create iddata objects for all trials
for i = 2 : numVals
   trialID = ['val', num2str(i)];
   trialName = data.(trialID);
   
   expID = ['z', num2str(i)];
   zval.(expID) = iddata(trialName.y(nd+1 : end , :), trialName.u(nd+1 : end , :), data.valparams.Ts);
   
   % merge all of the data sets into single multiexperiment object
   zval_merged = merge( zval_merged, zval.(expID) );
end

% % create iddate object for validation data set
% zval = iddata(data.validation.x, data.validation.u, data.valparams.Ts);

end

