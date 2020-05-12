clc; close all; clear;

h = 0.2;
x = 0:h:10;
y = zeros(2, length(x));
y(1, 1) = 0;
y(1, 2) = 30;
for i=1:(length(x)-1)
    k1 = f(x(i), y(i, :));
    k2 = f(x(i)+0.5*h, y(i, :)+0.5*h*k1);
    k3 = f(x(i)+0.5*h, y(i, :)+0.5*h*k2);
    k4 = f(x(i)+h, y(i, :)+h*k3);
    y(:,i+1) = y(:,i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h;
end

disp(y)
p = figure;
plot(x, y(1,:), 'r', x, y(1,:), 'bo');
xlabel('X')
ylabel('Y')
title('Runge-Kutta 4th order method visualization');
saveas(p, 'runge-kutta-second.png');