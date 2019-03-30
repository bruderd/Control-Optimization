function out = sysid_liftedSys( U, params , koopData )
%sysid_liftedSys: Defines the A, B, and C matrices that describe the linear
%lifted system z+ = Az + Bu, x = Cz.
%   Detailed explanation goes here

UT = U';    % transpose of koopman operator

A = UT( 1 : params.N , 1 : params.N );
B = UT( 1 : params.N , params.N+1 : end );

% matrix to recover non-lifted state
C = [eye(params.n), zeros(params.n , params.N - params.n)];   % C selects the first n entries of the lifted state (so output can be different than state)

% matrix to recover non-lifted output (assumes output is first ny states)
Cy = [eye(params.ny), zeros(params.ny , params.N - params.ny)];   % C selects the first ny entries of the lifted state (so output can be different than state)

% matrix to recover the state with delays, i.e. zeta
Cz = [eye(params.nzeta), zeros(params.nzeta , params.N - params.nzeta)];

% % solve for C matrix that best recovers state from lifted state
% Ctranspose = koopData.Px \ koopData.x ;
% C = Ctranspose' ;

%% find matrix that (approximately) projects a lifted point onto the subset of all legitimate lifted points in R^N

L = get_L4M( A , B , koopData , params );
R = get_R4M( L , Cz , koopData, params );
Mtranspose = L \ R; % pinv(L) * R ;
M = Mtranspose';

%% define outputs
out.A = M*A;  % edited to include projection M, 12/11/2018
out.B = M*B;  % edited to include projection M, 12/11/2018
out.Asim = A;
out.Bsim = B;
out.C = C;
out.Cz = Cz;
out.Cy = Cy;
out.M = M;
out.sys = ss(A,B,C,0, params.Ts);  % discrete state space system object
out.params = params;    % save system parameters as part of system struct
out.U = U;  % koopman operator matrix

end

