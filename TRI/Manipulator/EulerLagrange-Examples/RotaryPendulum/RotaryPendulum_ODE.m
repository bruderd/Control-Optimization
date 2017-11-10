function dYdt = RotaryPendulum_ODE(t,Y,tau,I,m,l,Rl,g)
%ROTARYPENDULUM_ODE
%    DYDT = ROTARYPENDULUM_ODE(T,Y,TAU,I,M,L,RL,G)

%    This function was generated by the Symbolic Math Toolbox version 7.1.
%    19-Oct-2016 14:08:13

t4 = Y(3);
t2 = sin(t4);
t3 = Rl.^2;
t5 = cos(t4);
t6 = Y(4);
t7 = t5.^2;
t8 = Y(2);
t9 = l.^2;
t10 = I.*1.2e1;
t11 = m.*t3.*1.2e1;
t12 = t2.^2;
t13 = m.*t9.*t12.*4.0;
t14 = t10+t11+t13-m.*t3.*t7.*9.0;
t15 = 1.0./t14;
t16 = t8.^2;
t17 = t6.^2;
dYdt = [t8;t15.*(tau.*1.2e1+Rl.*g.*m.*t2.*t5.*9.0-Rl.*l.*m.*t2.*t17.*6.0-m.*t2.*t5.*t6.*t8.*t9.*8.0+Rl.*l.*m.*t2.*t7.*t16.*6.0);t6;(t15.*(I.*g.*t2.*1.8e1+Rl.*t5.*tau.*1.8e1+g.*m.*t2.*t3.*1.8e1+I.*l.*t2.*t5.*t16.*1.2e1+g.*m.*t2.*t9.*t12.*6.0+l.*m.*t2.*t3.*t5.*t16.*1.2e1-l.*m.*t2.*t3.*t5.*t17.*9.0-Rl.*m.*t2.*t6.*t7.*t8.*t9.*1.2e1+l.*m.*t2.*t5.*t9.*t12.*t16.*4.0))./l];