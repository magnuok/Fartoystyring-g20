clear all;
close all;

V_g = 580/3.6;
g = 9.81;
zeta_chi = 1;
W_chi = 10;
w_n_phi = 1.1402;

a_phi_2 = -0.65;
a_phi_1 = 2.87;

%gains chi
w_n_chi = w_n_phi/W_chi;

k_p_chi = (2*zeta_chi*w_n_chi*V_g)/g;
k_i_chi = (w_n_chi^2*V_g)/g;
%gains phi
k_p_phi =  -2;
k_d_phi = 1.9351;

%disturbance
d =  deg2rad(1.5);


A = [
    -0.322 0.052   0.028   -1.12   0.002;
       0     0      1      -0.001    0;
       -10.6    0   -2.87   0.46    -0.65;
       6.87 0   -0.04   -0.32   -0.02;
       0    0   0   0   -7.5;
       ];

B = [0 0 0 0 7.5]';

C = [
    1 0 0 0 0;
    0 1 0 0 0;
    0 0 1 0 0;
    0 0 0 1 0;
    ];

D = [0 0 0 0]';

%% Kalman init
init_kalman;

%%
%desired course angle
chi_c = deg2rad(10);


%%
sim = sim('autopilot_2','SimulationMode', 'normal');
chi = sim.get('chi');
aileron = sim.get('aileron');
time = chi.time;
chi_values = chi.data;
aileron_input = aileron.data;
input = sim.get('var');

figure(1)
p(1) = plot(time, aileron_input); hold on;
title('Aileron Input', 'Interpreter', 'latex', 'FontSize', 13)
legend(p, '$\delta_a$', 'Interpreter', 'latex', 'FontSize', 13);
ylabel('$\delta_a$ []', 'Interpreter', 'latex', 'FontSize', 13)
xlabel('\textbf{Time} $[s]$', 'Interpreter', 'latex', 'FontSize', 13)
grid on

figure(2)
p(1) = plot(time, chi_values); hold on
p(2) = plot(time, input.signals.values); hold on
title('$\chi$', 'Interpreter', 'latex', 'FontSize', 13)
legend(p, '$\chi$', '$\chi_d$', 'Interpreter', 'latex', 'FontSize', 13);
ylabel('$\chi$ [rad]', 'Interpreter', 'latex', 'FontSize', 13)
xlabel('\textbf{Time} $[s]$', 'Interpreter', 'latex', 'FontSize', 13)
grid on



%% Kalman plotting
plotref;

