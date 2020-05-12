clc; close all; clear;

iter = 0; % Number of iterations
h = 0.1;  % Step
e = 1;    % Constraint
y0 = 1;   % Initial condition


f = @(x, y) 2 * x * y; % Ordinary differential equation
X = zeros(e / h, 1);
Y = zeros(e / h, 1);
dY = zeros(e / h, 1);

Y(1) = y0;

for i=1:h:(e+1)
    iter = iter + 1;
    dY(iter) = h * f(X(iter), Y(iter));
    
    if (i ~= (e+1))
        Y(iter + 1) = Y(iter) + dY(iter);
        X(iter + 1) = X(iter) + h;
    end
end

disp(Y);

p = figure;
plot(X, Y, 'b-', X, Y, 'ro');
title("Euler method visualization")
xlabel("X")
ylabel("Y")
saveas(p, 'euler.png');