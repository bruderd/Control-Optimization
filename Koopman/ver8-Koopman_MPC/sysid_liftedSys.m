function out = sysid_liftedSys( U, params )
%sysid_liftedSys: Defines the A, B, and C matrices that describe the linear
%lifted system z+ = Az + Bu, x = Cz.
%   Detailed explanation goes here

UT = U';    % transpose of koopman operator

A = UT( 1 : params.N , 1 : params.N );
B = UT( 1 : params.N , params.N+1 : end );
C = [eye(params.n), zeros(params.n , params.Np - params.n)];   % C selects the first n entries of the lifted state

%% define outputs
out.A = A;
out.B = B;
out.C = C;

end

