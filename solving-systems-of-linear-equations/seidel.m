function [x] = seidel(A, b, eps)
% Augmented matrix
B = [A, b];

size_A = size(A);
size_b = size(b);
size_eps = size(eps);

% Initial guess
x = zeros(size_b);

% Stop criterion variable
norm_val = Inf;

if(size_eps(1) ~= 1 || size_eps(2) ~= 1)
    error("Accuracy should be a floating point number.")
end

if (size_A(1) ~= size_b(1) || size_b(2) ~= 1)
    error("Input dimension incorrect.")
end

if (size_A(1) < size_A(2))
    error("Infinite number of solutions")
end

if (rank(A) < rank(B))
    error("No solutions")
end

while (norm_val > eps)
    x_old = x;
    
    for i=1:size_b(1)
        sigma = 0;
        
        for j=1:i-1
                sigma = sigma + A(i, j) * x(j);
        end
        
        for j=i+1:size_b(1)
                sigma = sigma + A(i, j) * x_old(j);
        end
        
        x(i) = (1/A(i, i)) * (b(i) - sigma);
    end
    
    norm_val = norm(x_old - x);
end
end