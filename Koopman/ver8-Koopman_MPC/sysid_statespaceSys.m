function out = sysid_statespaceSys( U, snapshotPairs, params )
%koopmanSysid_CG: Identifies system dynamics from snapshot pairs as described
% in Goncalves, Mauroy, "Linear identification of nonlinear systems: 
% A lifting technique based on the Koopman operator"
%   Detailed explanation goes here


% [x,y, L_scale, R_scale] = scale_snapshotPairs( snapshotPairs , params );
% % scale the snapshot pairs to help with model fitting (REMEBER THIS IS HERE)


%% Calculate the infiniesimal generator as funtion of coeffients, and from data (DNE)
disp('Calculating infinitesimal generator...')
Ldata = get_Ldata(U, params);   % infinitesimal generator from data
disp('Done.')

%% solve for the coefficients, i.e. Eq. (18) from Mauroy and Gonclaves (DNE)

% matrix of coefficents of monomials
w = calc_W(Ldata,snapshotPairs.x,params);

% w = L_scale * w * R_scale;    % scale the coefficients back up so that they can explain dynamics of real model

% dynamics (gives symbolic expression in terms of state and input)
vf2 = w * [params.Basis ; params.u];

matlabFunction(vf2, 'File', 'vf_koopman', 'Vars', { params.x, [params.xd; params.ud] , params.u} );


%% Define outputs
out.U       = U;            % koopman operator
out.Ldata   = Ldata;        % inf. generator from data
out.w       = w;            % matrix of coefficients of polybasis
out.vf      = @vf_koopman;  % function handle for dynamics of sysid'd sys.

end
