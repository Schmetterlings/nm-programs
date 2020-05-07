clc; close all; clear;

matrix = [1 1 1; 1 2 3; 1 3 6];
matrix_size = size(matrix);

vectors = [1; 0; 0];

if (matrix_size(1) ~= matrix_size(2))
    error("You can calculate only square matrices.")
end

for i=1:matrix_size(1)
    if (det(matrix(1:i, 1:i)) < 0)
        error("Matrix is not positive definite.")
    end
end

x = ones(matrix_size(1), matrix_size(1));
lambdas = ones(1, matrix_size(1));
i = 1;

while true
    lambdas(i) = sum(matrix(matrix_size(1), :)' .* x(:, i)) / x(matrix_size(1), i);
    for j=1:(matrix_size(1) - 1)
        x(j, i) = sum(matrix(j, :)' .* x(:, i)) / lambdas(i);
    end
    
    if (i >= 2 && abs(lambdas(i) - lambdas(i-1)) < 0.001)
        break
    end
    i = i + 1;
    if (length(lambdas) == i)
        old_x = x;
        x = [old_x ones(matrix_size(1), 1)];
        old_lambdas = lambdas;
        lambdas = [old_lambdas 0];
    end
end
