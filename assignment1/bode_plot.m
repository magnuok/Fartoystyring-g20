UK = 1;
T = 1;

kd = 1;
kp = 1;
ki = 1;

delta = 1;

num = [UK]; % Without
%num = [UK*kd, UK*kp, UK*ki]; % PID
%num = [UK*kd, 0, UK*ki]; % PI

denum = [T, 1 , 0, 0];

sys = tf(num,denum);

bode(sys);