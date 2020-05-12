clc; close all; clear;

iter = 0; % Number of iterations
h = 0.1;  % Step
e = 1;    % Constraint
y0 = 1;   % Initial condition


f = @(x, y) 2 * x * y; % Ordinary differential equation
X = zeros(e / h, 1);
Y = zeros(e / h, 1);
dY = zeros(e / h, 1);
k = zeros(4, 1); % Fourth order table

Y(1) = y0;

for i=1:h:(e+1)
    iter = iter + 1;
    
    k(1) = h * f(X(iter), Y(iter));
    k(2) = h * f(X(iter) + 0.5 * h, Y(iter) + 0.5 * k(1));
    k(3) = h * f(X(iter) + 0.5 * h, Y(iter) + 0.5 * k(2));
    k(4) = h * f(X(iter) + h, Y(iter) + k(3));
    dY(iter) = (1/6) * (k(1) + 2 * k(2) + 2 * k(3) + k(4));
    
    if (i ~= (e+1))
        Y(iter + 1) = Y(iter) + dY(iter);
        X(iter + 1) = X(iter) + h;
    end
end

disp(Y);

p = figure;
plot(X, Y);
title("Runge-Kutta 4th order method visualization")
xlabel("X")
ylabel("Y")
saveas(p, 'runge-kutta-first.png');