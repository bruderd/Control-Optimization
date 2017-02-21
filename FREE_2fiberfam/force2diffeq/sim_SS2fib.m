% SSsim_2fib


clear

%% Set desired parameter values
Pss = 1;     % steady state pressure (input)

% Relaxed parameters (when P = 0)
P_rest = 0;
gama_rest = deg2rad(40);
betta_rest = deg2rad(-40); 
r_rest = 3/16;
L_rest = 5;
phi_rest = 0;
T_gama_rest = 0;
T_betta_rest = 0;
x_rest = [P_rest, gama_rest, betta_rest, r_rest, L_rest, phi_rest, T_gama_rest, T_betta_rest];

N = 100;        % number of pressure steps to reach steady state value
dP = (Pss/N);   % pressure step size


%% Iteratively solve for state at each pressure step

x = zeros(N+1,8);
x(1,:) = x_rest;
dx = 0.1;
dtens = 0.1;

for k = 1:N
    u = dP*k;
    
    [P0, gama0, betta0, r0, L0, phi0, T_gama0, T_betta0] = deal(x(k,1), x(k,2), x(k,3), x(k,4), x(k,5), x(k,6), x(k,7), x(k,8));
    x0 = [P0, gama0, betta0, r0, L0, phi0, T_gama0, T_betta0];
    
    % Solve for the tension forces with all other parameters fixed
    tensioneq = @(x)tensioneq_2fib_v2(x, u, x0);
    LB_tens = [u-dx, gama0-dx, betta0-dx, r0, L0-dx, phi0-dx, 0, 0];
    UB_tens = [u+dx, gama0+dx, betta0+dx, r0+dx, L0+dx, phi0+dx, Inf, Inf];
    tens = lsqnonlin(tensioneq, x0, LB_tens, UB_tens);
    
    % Solve for steady state behavior with the tension forces
    fun = @(x)staticeq_2fib_v2(x, u, x0);
    T_gama = tens(7);
    T_betta = tens(8);
    LB = [u-1, -pi/2, -pi/2, r0*1.01, L0*0.4, -Inf, T_gama-dtens, T_betta-dtens];
    UB = [u+1, pi/2, pi/2, r0*5, L0*2, Inf, T_gama+dtens, T_betta+dtens];
    x(k+1,:) = lsqnonlin(fun, x0, LB, UB);
    
end


%% Plot results

figure
set(gcf,'numbertitle','off','name','Steady State Iterative Simulation Results') % See the help for GCF

subplot(2,3,1)       
plot(x(:,1))
title('Pressure (psi)')

subplot(2,3,2)       
plot(rad2deg(x(:,2)))
title('gamma (deg)')

subplot(2,3,3)       
plot(rad2deg(x(:,3)))
title('beta (deg)')

subplot(2,3,4)       
plot(x(:,4))
title('radius (in)')

subplot(2,3,5)       
plot(x(:,5))
title('Length (in)')

subplot(2,3,6)       
plot(rad2deg(x(:,6)))
title('phi (deg)')

