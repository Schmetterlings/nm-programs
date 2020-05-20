clc; close all; clear;

a = -1; % Lower bound of approximation interval
b = 1;  % Upper bound of approximation interval
n = 2;   % Degree of approximating polynomial

%%% Calculations %%%
m = 100;

ak = zeros(n + 1, 1);
bk = zeros(n + 1, 1);
W = 0;

for i=1:n+1
    bkf = @(x) weight(x) * polynomial(i, x)^2;      % Expression 6.9
    akf = @(x) weight(x) * polynomial(i, x) * f(x); % Expression 6.8
    % Using Composite quadrature formula to calculate definite integral
    bk(i) = composite(a, b, m, bkf);
    ak(i) = composite(a, b, m, akf) / bk(i);
    % Approximating polynomial calculated for distance metric
    W = W + ak(i)^2 * bk(i);
end

% Calculating distance metric
distf = @(x) weight(x) * f(x)^2;
dist = composite(a, b, m, distf) - W;

disp("Coefficients of generalized approximating polynomial:")
disp(ak)
fprintf("Distance between approximated and approximating functions: %f\n", dist)