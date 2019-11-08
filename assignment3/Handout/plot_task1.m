% Plots yaw and yaw rate
% Magnus knaedal
close all;

% Choose degrees or radians for the yaw angle
if true, radconv = 180/pi; else radconv = 1; end

% Choose RGB plotcolor of actual position
clr = [0 0.5 0.9];
clr2 = [0.1 0.8 0.1];

%% Plot on a 2x1 plot with reference and actual on top of each other
figure;

subplot(2,1,1);
p(1) = plot(t,psi,'r','LineWidth',1.2); grid on;
hold on
title('Yaw');
legend('yaw angle psi');
ylabel('Angle [deg]');
xlabel('Time [s]');

subplot(2,1,2);
p(1) = plot(t,r,'r','LineWidth',1.2); grid on;
legend('yaw rate r');
title('Yaw rate');
ylabel('Angle rate [deg/s]');
xlabel('Time [s]');


%% time constant
r_max = r(length(r));
idx = max(find(abs(r_max-r(0))>=0.37*r_max))
