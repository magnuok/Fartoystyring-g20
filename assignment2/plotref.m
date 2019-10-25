
rad2deg = 180/pi;

x_hat = sim.get('xhat');
x_real_noise = sim.get('x_real_noise');
w = sim.get('w');
y_real = sim.get('y_real');
x_real = x_real_noise.Data(:,1:4) - w.Data(:,1:4);

% Plots real shart vs the kalman estimates ones

figure(3);
subplot(2,2,1);
%p(1) = plot(x_real_noise.Time, x_real_noise.Data(:,1), '-g', 'LineWidth',1); hold on
p(1) = plot(y_real.Time, y_real.Data(:,1)*rad2deg ,'-r','LineWidth',1.2); hold on
p(2) = plot(x_hat.Time, x_hat.Data(:,1)*rad2deg,'-b','LineWidth',1.2); hold on

title('$\beta$', 'Interpreter', 'latex', 'FontSize', 13)
legend(p, '$\beta$ actual', '$\hat{\beta}$ estimated', 'Interpreter', 'latex', 'FontSize', 13);
ylabel('$\beta$ [deg]', 'Interpreter', 'latex', 'FontSize', 13)
xlabel('\textbf{Time} $[s]$', 'Interpreter', 'latex', 'FontSize', 13)
grid on
hold off

subplot(2,2,2);
%p(1) = plot(x_real_noise.Time, x_real_noise.Data(:,2), '-g', 'LineWidth',1); hold on
p(1) = plot(y_real.Time, y_real.Data(:,2)*rad2deg, '-r','LineWidth',1.2); hold on
p(2) = plot(x_hat.Time, x_hat.Data(:,2)*rad2deg, '-b','LineWidth',1.2); hold on

title('$\phi$', 'Interpreter', 'latex', 'FontSize', 13)
legend(p, '$\phi$ actual', '$\hat{\phi}$ estimated', 'Interpreter', 'latex', 'FontSize', 13);
ylabel('$\phi$ [deg]', 'Interpreter', 'latex', 'FontSize', 13)
xlabel('\textbf{Time} $[s]$', 'Interpreter', 'latex', 'FontSize', 13)
grid on
hold off

subplot(2,2,3);
p(1) = plot(x_real_noise.Time, x_real_noise.Data(:,3)*rad2deg, '-g', 'LineWidth',1); hold on
p(2) = plot(x_real_noise.Time, y_real.Data(:,3)*rad2deg, '-r','LineWidth',1.2); hold on
p(3) = plot(x_hat.Time,x_hat.Data(:,3)*rad2deg, '-b','LineWidth',1.2); hold on

title('$p$', 'Interpreter', 'latex', 'FontSize', 13)
legend(p, '$p$ actual with noise', '$p$ actual', '$\hat{p}$ estimated', 'Interpreter', 'latex', 'FontSize', 13);
ylabel('$p$ [deg/s]', 'Interpreter', 'latex', 'FontSize', 13)
xlabel('\textbf{Time} $[s]$', 'Interpreter', 'latex', 'FontSize', 13)
grid on
hold off

subplot(2,2,4);
p(1) = plot(x_real_noise.Time, x_real_noise.Data(:,4)*rad2deg, '-g', 'LineWidth',1); hold on
p(2) = plot(x_real_noise.Time, y_real.Data(:,4)*rad2deg,'-r','LineWidth',1.2); hold on
p(3) = plot(x_hat.Time, x_hat.Data(:,4)*rad2deg,'-b','LineWidth',1.2); hold on

title('$r$', 'Interpreter', 'latex', 'FontSize', 13)
legend(p, '$r$ actual with noise', '$r$ actual', '$\hat{r}$ estimated', 'Interpreter', 'latex', 'FontSize', 13);
ylabel('$r$ [deg/s]', 'Interpreter', 'latex', 'FontSize', 13)
xlabel('\textbf{Time} $[s]$', 'Interpreter', 'latex', 'FontSize', 13)
grid on
hold off
