%% Information 
% This file is only an example of how you can start the simulation. The
% sampling time decides how often you store states. The execution  time
% will increase if you reduce the sampling time.

% Please note that the file "pathplotter.m" (only used in the second part
% of the assignment) shows the ship path during the path following and
% target tracking part of the assignment. It can be clever to adjust the sampling
% time when you use that file because it draws a sketch of the ship in the
% North-East plane at each time instant. Having a small sampling time will
% lead to multiple ship drawings on top of each other. 

% You should base all of your simulink models on the MSFartoystyring model
% and extend that as you solve the assignment. For your own sake, it is
% wise to create a new model and run file for each task.

% The msfartoystyring.m file includes the ship model. You are not allowed
% to change anything within that file. You need to include that file in
% every folder where you have a simulink model based on
% "MSFartoystyring.slx". 

% WP.mat is a set of six waypoints that you need to use in the second part of
% the assignment. The north position is given in the first row and the east
% position in the second row. 


%% simulation constants
tstart=0;           % Sim start time
tstop=10000;        % Sim stop time
tsamp=10;           % Sampling time for how often states are stored. (NOT ODE solver time step)
                
p0=zeros(2,1);      % Initial position (NED)
v0=[3 0]';       % Initial velocity (body)
psi0=0;             % Inital yaw angle
r0=0;               % Inital yaw rate
c=1;                % Current on (1)/off (0)

dc = 0*180/pi;
u_reference_0 = 3;
u_reference_1 = 7;

%% plots
Kp_u = 50;
Ki_u = 1e-2; %-1e-6;
Kp = -8;
Kd = -53;
Ki = -1.6e-3;%-1e-6; 


try 
    sim('MSFartoystyring');
catch exception
    error_var = lasterror
    stack_var = dbstack
    exception_var = getReport(exception, 'extended');
end

r = r.*radconv;
psi = psi.*radconv;
yaw_reference = yaw_reference.*radconv;
yaw_error = yaw_error.*radconv;
yaw_rate_desired = yaw_rate_desired.*radconv;
yaw_rate_error = yaw_rate_error.*radconv;
rudder_input = rudder_input.*radconv;


fig_3 = figure;
subplot(3,1,1)
plot(t, v(:,1), 'r', 'LineWidth', 1.2);  
hold on;
plot(t, u_desired, 'b',  'LineWidth', 1.2); 
grid on;
title('Surge speed');
legend('u' ,'u_d');
ylabel('Speed [m/s]');
xlabel('Time [s]');

subplot(3,1,2);
hold on;
plot(t, psi, 'r', 'LineWidth', 1.2); 
plot(t,r,'b','LineWidth', 1.2); 
grid on;
legend('\psi', 'r');
title('Yaw and yaw rate');
ylabel('Angle rate [deg/s]');
xlabel('Time [s]');

subplot(3,1,3);
hold on;
plot(t, shaft_speed, 'r', 'LineWidth', 1.2);
plot(t, rudder_input, 'b', 'LineWidth', 1.2);
plot([0, 10000], [510, 510], 'k');
plot([0, 10000], [-510, -510], 'k');
grid on;
legend('n_c', '\delta_c', 'Maximum velocity');
title('Rudder input');
ylabel('Angle [deg]');
xlabel('Time [s]');


hgexport(fig_3, 'task_1_8');

%% controller constants
Kp = -8;
Kd = -53;
Ki = -1.6e-3;%-1e-6; 



r = r.*radconv;
psi = psi.*radconv;
yaw_reference = yaw_reference.*radconv;
yaw_error = yaw_error.*radconv;
yaw_rate_desired = yaw_rate_desired.*radconv;
yaw_rate_error = yaw_rate_error.*radconv;
rudder_input = rudder_input.*radconv;

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



%% plots
fig = figure(1);
hold on;
plot(1:1:length(r), r);
