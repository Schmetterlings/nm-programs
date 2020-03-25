clear; clc;

A = [5 2; 2 4];
b = [19; 14];
accuracy = 0.0001;

g = gauss(A, b);
s = seidel(A, b, accuracy);

fprintf("Gauss elimination method solution: %.4f, %.4f\n", g(1), g(2));
fprintf("Seidel method solution: %.4f, %.4f\n", s(1), s(2));