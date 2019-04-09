function params = def_fourierLift( params )
%def_fourierLift: Defines the lifting function that lifts state variable x to
% a fourier basis

[n, p, nzeta, maxDegree] = deal(params.n, params.p, params.nzeta, params.maxDegree);

x = sym('x', [n, 1]);   % state variable x
xd = sym('xd', [params.nd * params.n, 1]);   % state delays i.e. for 2 delays: [x_i-1, x_i-2]'
ud = sym('ud', [params.nd * params.p, 1]);   % input delays i.e. for 2 delays: [u_i-1, u_i-2]'
zeta = [x ; xd; ud];    % state variable with delays
u = sym('u', [p, 1]);   % input vector u

% Number of basis elements, i.e. dimenstion of p(x)
N = nzeta + (1 + 2*maxDegree)^nzeta; 

% create sins of cosines of all the states
poop = sym( zeros(1+2*maxDegree , nzeta) );
for i = 1 : nzeta
    poop(1,i) = 1;
    for j = 1 : maxDegree
        poop(2*j,i)   = cos(2*pi*j*zeta(i));
        poop(2*j+1,i) = sin(2*pi*j*zeta(i)); 
    end
end

% define fourier basis vector
fourierBasis = poop(:,1);
for i = 2 : nzeta 
    fourierBasis = kron(fourierBasis, poop(:,i));
end

% put the full state at the beginnig of the basis vector
fourierBasis = [zeta ; fourierBasis];

% create the lifting function: x -> p(x)
matlabFunction(fourierBasis, 'File', 'stateLift', 'Vars', {zeta});

%% define derivative of lifted state with respect to x

dlift = jacobian(fourierBasis,x);
matlabFunction(dlift, 'File', 'jacobianLift', 'Vars', {zeta});

%% output variables  
params.Basis = fourierBasis;    % symbolic vector of basis functions, p(x)
params.jacobianBasis = dlift;   % symbolic jacobian of the vector of basis monomials
params.N = N;   % dimension of basis (including the state itself)
params.Np = N + p;  % dimension of the lifted state
params.x = x;   % symbolic state variable
params.u = u;   % symbolic input variable
params.xd = xd; % symbolic state delays
params.ud = ud; % symbolic input delays

end