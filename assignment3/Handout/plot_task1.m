% Plots yaw and yaw rate
% Magnus knaedal
close all;

% Choose degrees or radians for the yaw angle
radconv = 180/pi;

% Choose RGB plotcolor of actual position
clr = [0 0.5 0.9];
clr2 = [0.1 0.8 0.1];

%% to radians
r = r.*radconv;
psi = psi.*radconv;

%% Plot on a 2x1 plot with reference and actual on top of each other
fig = figure;

subplot(2,1,1);
p(1) = plot(t,psi,'r','LineWidth',1.2); grid on;
hold on
title('Yaw');
legend('yaw angle \psi');
ylabel('Angle [deg]');
xlabel('Time [s]');

subplot(2,1,2);
p(1) = plot(t,r,'r','LineWidth',1.2); grid on;
legend('yaw rate r');
title('Yaw rate');
ylabel('Angle rate [deg/s]');
xlabel('Time [s]');

% hgexport(fig, 'yaw_and_yawrate');

%% plot nomoto system
fig_nomoto_approx = figure(3);
hold on;
plot(1:1:4000, [r(1:900); ones(3100,1)*0.0055].*radconv, 'color', 'k');
K = -0.0314;
T = 9;
sys = tf([K], [T 1]);
step(-sys*0.175*radconv, 150);
ylabel('Amplitude (Degrees)');
legend('Simulated Response', 'Nomoto Model');
hgexport(fig_nomoto_approx, 'nomoto_approx');

