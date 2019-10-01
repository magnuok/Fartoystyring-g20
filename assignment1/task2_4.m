deg2rad = pi/180;   
rad2deg = 180/pi;

N = 1200000;
h = 0.1;
U = 5;
T = 20;
K = 0.1;
b = 0.001;

%gains
kp = 0.0002;
kd = 0.5;
ki = 0.00;

x = zeros(1,N+1);
y = x;
r = x;
psi = x;
t = x;
%error = x;

x(1) = 0;
y(1) = 100;
psi(1) = 0;
r(1) = 0;
integral = 0;


for i = 1:N
    t(i+1) = (i-1)*h;
    
    integral=integral+y(i);
   
    delta = (-kp*y(i)-kd*U*psi(i)-ki*integral);
    
    if delta > 20*pi/180
        delta = 20*pi/180;
    end
    if delta < -20*pi/180
        delta = -20*pi/180;
    end
    
    x(i+1) = x(i) + h*U*cos(psi(i));
    y(i+1) = y(i) + h*U*sin(psi(i));
    r(i+1) = -T^(-1)*r(i) + h * T^(-1)*(K*delta + b);
    psi(i+1) = psi(i) + h*r(i);
    
  
end



% PLOT FIGURES

figure (1); clf;
hold on;
plot(t, y, 'b');
hold off;
grid on;
legend('\phi');
title('error in y');
xlabel('time [s]'); 
ylabel('y_error [m]');