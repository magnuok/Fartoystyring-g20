% script for calculating necessary matrices for the discrete Kalman filter.

Ts = 0.01; v% time step
% continuous system matrices
A = [-0.322 0.052 0.028 -1.12
     0      0     1     -0.001
     -10.6  0     -2.87 0.46
     6.87   0     -0.04 -0.32];
 
B = [0.002 0 -0.65 -0.02]';
E = eye(4);

C = [0 0 1 0
     0 0 0 1];
 
% discrete system matrices, computed here and used in kalman_K
[PHI, DELTA] = c2d(A,B,Ts);
[PHI, GAMMA] = c2d(A,E,Ts);

mat = [0.001 0 0 0  
       0     1 0 0  
       0 0   100 0  
       0 0   0   10 
                    ];

Q = Ts*10^-6*mat;
R = 0.2^2*eye(2);   

% continuous state space model
sys = ss(A,[B E], C, 0);

% discrete Kalman estimator for the continuous plant
% L is the Kalman gain, and is precomputed here for use in kalm2
[kest, L, P, M, Z] = kalmd(sys, Q, R, Ts); 

save('matrices.mat', 'PHI', 'DELTA', 'GAMMA', 'C', 'L')