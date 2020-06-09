clc; close all; clear;

f = @(x) x^3;
k = @(x) -x;

a = -5;   % Lower bound
b = 5;   % Upper bound
N = 5;  % Inner loop iterations
n = 20;   % Outer loop iterations
alpha = 5;

dt = (b - a) / (N - 1);
x = a:dt:b;
y = zeros(n, N);
sum = 0;

% Solve integral equation
for z=2:n
    for i=2:N
        sum = 0;
        for j=1:i
            sum = sum + k(x(i) - x(j)) * y(z-1, j) * dt;
        end
        y(z, i) = alpha * sum + f(x(i));
    end
end

% Calculate inverse Laplace transformation
syms s
Y = f(s) / (1 - alpha * k(s));
lap = ilaplace(Y);

% Draw plots
p = figure(1);
hold on;
fplot(lap)
plot(x, y(end, :))
