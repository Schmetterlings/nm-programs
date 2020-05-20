function [x] = gauss(A, b)
% Augmented matrix
B = [A, b];

size_A = size(A);
size_b = size(b);
size_B = size(B);

% Not equal number of rows in matrices or more than one column in b
if (size_A(1) ~= size_b(1) || size_b(2) ~= 1)
    error("Input dimension incorrect.")
end

if (size_A(1) < size_A(2))
    error("Infinite number of solutions")
end

if (rank(A) < rank(B))
    error("No solutions")
end

% Single division scheme
for i=1:1:size_A(1)
    % Swap rows if leading element is a zero
    if (B(i, i) == 0)
        [~, I] = max(B);
        B([i I(i)], :) = B([I(i) i], :);
    end
    
    B(i, :) = B(i, :) ./ B(i, i);
    
    for j=i+1:1:size_A(1)
        B(j, :) = B(j, :) - B(i, :) .* B(j, i);
    end
end

% Eliminate remaining coefficients for back-substitution
for i=size_A(1):-1:1
    for j=i:-1:2
        B(j-1, :) = B(j-1, :) - B(i, :) .* B(j-1, i);
    end
end

x = B(:, size_B(2));
end