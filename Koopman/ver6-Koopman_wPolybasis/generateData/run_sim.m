function data = run_sim( params )
%gen_data: Runs a simulation and generates system "measurement"
%   Detailed explanation goes here

% add folder containing system dynamics to path
vf_path = [pwd, filesep, 'systemDynamics'];
addpath(vf_path);

get_input(0,0,params,'clear');
options = odeset('OutputFcn',@(t,x,flag) get_input(t, x, params, flag), 'refine', 1);
x0 = params.x0;
sol = ode45(@(t, x) params.vf_real(t, x, get_input(t,x,params, 'pass2ode'),params),[0 params.duration], x0, options);    % with damping

tout = sol.x;
usol = get_input(0,0,params,'allout');


%% Get state "measurements"

% get the state at sampled times
t = (0 : params.Ts : params.duration)';
x = deval(sol, t)';
u = interp1(tout, usol, t);

% isolate observed states (may not be full state)
yobs = x(:, logical(params.observe));

% inject noise to simulate measurement noise
noise = params.sigma .* randn(size(yobs)) + params.mean;
y = yobs + noise;

% % moving average filter to reduce impact of noise
% x = movmean(x, 5);
% 
% % use numerical derivatives for thetadot instead of measured ones (comment out this section for full state measurements)
% xdot = ( x(2:end, 1:2) - x(1:end-1,1:2) ) / params.Ts;
% xdot = [xdot; zeros(1,2)];
% xdot = movmean(xdot, 5);    % filter the numerical derivatives 
% x = [x(:, 1:2) , xdot(:,:)];

% define output
data = struct;
data.t = t;     % time vector
data.y = y;     % state "measurements"
data.u = u;     % input
data.x = x;     % actual state


% remove folder conatining system dynamics to path
rmpath(vf_path);

end

