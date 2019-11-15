dbstop if error
load('WP.mat');
%% constants
tstart=0;           % Sim start time
tstop=4250;         % Sim stop time
tsamp=10;           % Sampling time for how often states are stored. (NOT ODE solver time step)
                
p0=zeros(1000, 700);      % Initial position (NED)
v0=[6 63]';       % Initial velocity (body)
psi0=deg2rad(60);             % Inital yaw angle
r0=0;               % Inital yaw rate
c=1;                % Current on (1)/off (0)

dc = 0*180/pi;
u_reference_0 = 3;
u_reference_1 = 7;

Kp_u = 50;
Ki_u = 1e-2; %-1e-6;

Kp = -1;
Kd = -100;
Ki = -2e-5;%-1e-6; 

%% run simulation
try 
    sim('MSFartoystyring_task2_5');
catch exception
    error_var = lasterror;
    stack_var = dbstack;
    exception_var = getReport(exception, 'extended');
end



%% plot
pathplotter(p(:,1), p(:,2), psi, tsamp, 4, tstart, tstop, 0, WP)

