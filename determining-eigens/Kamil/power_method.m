clc; close all; clear;

matrix = [1 1 1; 1 2 3; 1 3 6];
matrix_size = size(matrix);

vectors = [1; 0; 0];

if (matrix_size(1) ~= matrix_size(2))
    error("You can calculate only square matrices.")
end

for i=2:(matrix_size(1)^2)
    for j=1:matrix_size(1)
        vectors(j, i) = sum(matrix(j, :)' .* vectors(:, i - 1));
    end
end

highest_eigenvalue = sum(vectors(:, end) ./ vectors(:, end-1)) / matrix_size(1);

disp("Eigenvector corresponding to highest-modulus eigenvalue:")
disp(vectors(:, end))

normalized_vec = vectors(:, end);
[~, I] = max(abs(normalized_vec));
normalized_vec = normalized_vec / normalized_vec(I);
disp("Eigenvector after normalization:")
disp(normalized_vec);