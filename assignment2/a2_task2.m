close all;
a_phi2 = -0.65;
a_phi1 = 2.87;

k_p = -2;
k_d = 1.9351;

num = [a_phi2];
denum = [1, a_phi1+a_phi2*k_d, a_phi2*k_p, 0];

sys = tf(num,denum);


%k_i = 0:0.1:10

rlocus(-sys)