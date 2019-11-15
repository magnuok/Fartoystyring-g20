%% calculate crab angle
% use equation 2.117 (assuming small angles)

U = sqrt(v(:,1).^2 + v(:,2).^2);
beta = v(:,2)./U;
course = psi + beta;

%% convert
% to degrees
psi = rad2deg(psi);
course = rad2deg(course);
beta = rad2deg(beta);
chi_d = rad2deg(chi_d);
psi_d = rad2deg(psi_d);


%% plot
% Show the problem by displaying a gure with the course ?, heading ?, desired course
% ?d (from the guidance system) and crab angle ? from the simulation results acquired in Task 2.2.
% Include the gure in the report and comment on the results.

figure(); hold on; grid on;
plot(t, psi, 'LineWidth', 1.5);
plot(t, course, 'LineWidth', 1.5);
plot(t, beta, 'LineWidth', 1.5);
plot(t, chi_d, 'LineWidth', 1.5);
plot(t, psi_d, 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('Angle [deg]');
legend('psi', 'course', 'beta', 'chi_d', 'psi_d');


%% 

fig_1 = figure;

subplot(3,1,1);
plot(t, psi, 'r', 'LineWidth', 1.2); 
grid on;
hold on
plot(t, yaw_reference, 'b', 'LineWidth', 1.2);
title('Yaw');
legend('\psi ', '\psi_d');
ylabel('Angle [deg]');
xlabel('Time [s]');

subplot(3,1,2);
hold on;
plot(t,r,'r','LineWidth', 1.2); 
plot(t, yaw_rate_desired, 'b', 'LineWidth', 1.2);
grid on;
legend('r', 'r_d');
title('Yaw rate');
ylabel('Angle rate [deg/s]');
xlabel('Time [s]');

subplot(3,1,3);
hold on;
plot(t, rudder_input, 'r', 'LineWidth', 1.2);
plot([0, 10000], [25, 25], 'k');
plot([0, 10000], [-25, -25], 'k');
grid on;
legend('\delta_c');
title('Rudder input');
ylabel('Angle [deg]');
xlabel('Time [s]');


fig_error = figure();
subplot(2,1,1);
plot(t, yaw_error, 'LineWidth', 1.2);
grid on;
legend('\psi error');
title('Yaw error');
ylabel('Angle [deg]');
xlabel('Time [s]');

subplot(2,1,2);
plot(t, yaw_rate_error, 'LineWidth', 1.2);
grid on;
legend('r error');
title('Yaw rate error');
ylabel('Angle rate [deg/s]');
xlabel('Time [s]');

hgexport(fig_1, 'task_1_4_response');
hgexport(fig_error, 'task_1_4_error');

