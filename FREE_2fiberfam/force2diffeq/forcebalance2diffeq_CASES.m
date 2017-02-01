clear all;

% syms r0 L0 gama0 P gama r L dP dgama dr dL c1 c2 c3 c4 c5 c6
syms r0 L0 gama0 dP dgama dr dL c1 c2 c3 c4 c5 c6 betta0 nrat

assume(r0, 'real')
assumeAlso(L0, 'real')
assumeAlso(gama0, 'real')
assumeAlso(betta0, 'real')
assumeAlso(dP, 'real')
assumeAlso(dgama, 'real')
assumeAlso(dr, 'real')
assumeAlso(dL, 'real')
assumeAlso(c1, 'real')
assumeAlso(c2, 'real')
assumeAlso(c3, 'real')
assumeAlso(c4, 'real')
assumeAlso(c5, 'real')
assumeAlso(c6, 'real')
assumeAlso(nrat, 'real')


syms t

P = sym('P(t)');
gama = sym('gama(t)');
betta = sym('betta(t)');
r = sym('r(t)');
L = sym('L(t)');
phi = sym('phi(t)');

% theta = tan(gama)*L/r;
% phi = (tan(gama)*L/r - tan(gama0)*L0/r0);  %switch the sign to be consistent with Josh's sign convention of twist (1/26/2017)

assumeAlso(P, 'real')
assumeAlso(gama, 'real')
assumeAlso(betta, 'real')
assumeAlso(r, 'real')
assumeAlso(L, 'real')
assumeAlso(phi, 'real')

%% Definition of elastomer spring force functions, constants from sys id experimental data
% F_elast = [c1 c2 c3] * [L^2, L, 1]';
% M_elast = [c4 c5 c6] * [theta^2, theta, 1]';

%simpler version
F_elast = c1*(L0-L);    
M_elast = c4 * (-1) * phi;    % removed (-1) becasue I changed phi up there (1/26/2017). Put it back (1/30/2017)

% %simplest version
% F_elast = 0;   
% M_elast = 0;  


%% Case 1: gama,betta>0, gama>betta. Differentiates the system of equations wrt time (2 fibers) (1/28/2017)
   
T_gama = (4*P*r^2*pi*(2*cot(gama) - cot(betta) + cos((pi*tan(betta))/tan(gama))*cot(betta)))/(sin(gama)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3));
T_betta = (4*P*r^2*pi*(2*cot(betta) - cot(gama) + cos(pi*(nrat - tan(gama)/tan(betta)))*cot(gama) - nrat*cot(gama)))/(sin(betta)*(cos((pi*tan(betta))/tan(gama)) - nrat + cos(pi*(nrat - tan(gama)/tan(betta))) - cos((pi*tan(betta))/tan(gama))*cos(pi*(nrat - tan(gama)/tan(betta))) + nrat*cos((pi*tan(betta))/tan(gama)) + 3));
theta_gama0 = -tan(gama0)*L0/r0;     % (-) fixes sign convention (1/28/2017)
theta_betta0 = -tan(betta0)*L0/r0;   % (-) fixes sign convention (1/28/2017)
theta_gama = -tan(gama)*L/r;       % (-) fixes sign convention (1/28/2017)

force_balance = diff( 0 == P*pi*r^2 - (T_gama*cos(gama) + T_betta*cos(betta)) + F_elast ,  t);   
torque_balance = diff( 0 == (T_gama*sin(gama) + T_betta*sin(betta)) + M_elast ,  t);               
geometry_constraint1 = diff( 0 == L/cos(gama) + r*(theta_gama0 + phi)/sin(gama) ,  t);
geometry_constraint2 = diff( 0 == L/cos(betta) + r*(theta_betta0 + phi)/sin(betta) ,  t);
geometry_constraint3 = diff( 0 == (theta_gama - theta_gama0) - phi ,  t);        


System_2fib = [force_balance; torque_balance; geometry_constraint1; geometry_constraint2; geometry_constraint3];
