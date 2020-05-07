clc; close all; clear;

matrix = [1 1 1; 1 2 3; 1 3 6];
matrix_size = size(matrix);

vectors = [1; 0; 0];

if (matrix_size(1) ~= matrix_size(2))
    error("You can calculate only square matrices.")
end

% Determining characteristic polynomial coefficients
for i=2:(matrix_size(1) + 1)
    for j=1:matrix_size(1)
        vectors(j, i) = sum(matrix(j, :)' .* vectors(:, i - 1));
    end
end

coefficients = flip(linsolve(vectors(:, 1:end-1), -vectors(:, end)));
coefficients_size = length(coefficients);
eigenvalues = roots([1; coefficients]);
eigenvalues_size = length(eigenvalues);

% Calculating eigenvectors
g = ones(coefficients_size);
x = zeros(coefficients_size, eigenvalues_size);

for i=1:eigenvalues_size
    for j=(coefficients_size - 1):-1:1
        g(j) = eigenvalues(i) * g(j + 1) + coefficients(coefficients_size - j) * g(coefficients_size);
    end
    
    for j=1:coefficients_size
        x(:, i) = g(j) * vectors(:, j) + x(:, i);
    end
end

x = flip(x, 2);
disp("Calculated components of eigenvectors:")
disp(x)

normalized_x = x;
for i=1:coefficients_size
    [~, I] = max(abs(x(:, i)));
    normalized_x(:, i) = normalized_x(:, i) / normalized_x(I, i);
end
disp("Calculated components of eigenvectors after normalization:")
disp(normalized_x);