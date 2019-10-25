function x_est  = kalman_K(y,delta_a_c)
% this function is a Kalman filter that
% returns the estimate y_hat based on the noisy measurement and control u
% 

persistent x_hat
if isempty(x_hat)
    x_hat = zeros(4,1);
end

PHI = [0.9964    0.0005    0.0003   -0.0112
   -0.0005    1.0000    0.0099    0.0000
   -0.1042   -0.0000    0.9717    0.0051
    0.0685    0.0000   -0.0004    0.9964];

DELTA = [    0.0000
   -0.0000
   -0.0064
   -0.0002];

C = [0 0 1 0
     0 0 0 1];


x_hat = PHI*x_hat + DELTA*delta_a_c + K*(y-C*x_hat);

x_est = x_hat;
end
