clc; close all; clear;

a = 1; % Lower bound of approximation interval
b = 4; % Upper bound of approximation interval
n = 1; % Degree of approximating polynomial
N = 3; % Number of approximation nodal points (N >= n)

%%% Calculations %%%
x = a :(b-a)/N:b;
A = zeros(n);
B = zeros(n + 1, 1);
coeff = zeros(n + 1, 1);

Tsum = 0;
S = zeros(n + 1, 1);
Ssum = 0;

for i=1:n+1
    for j=1:N+1
        Tsum = Tsum + (f(x(j)) * x(j)^(i-1));
    end
    B(i) = Tsum;
    Tsum = 0;
end

for i=1:n+2
    for j=1:N+1
        Ssum = Ssum + (x(j)^(i-1));
    end
    S(i) = Ssum;
    Ssum = 0;
end

for i=1:n+1
    for j=1:n+1
        A(i, j) = S(i+j-1);
    end
end

coeff = gauss(A, B);
dist = 0;
for i=1:N+1
    dist = dist + (f(x(i)) - W(x(i), coeff))^2;
end
dist = sqrt(dist);

disp("Coefficients of generalized approximating polynomial:")
disp(coeff)
fprintf("Distance between approximated and approximating functions: %f\n", dist)

function out = W(x, c)
out = 0;
for i=1:length(c)
    out = out + (x^(i-1) * c(i));
end
end