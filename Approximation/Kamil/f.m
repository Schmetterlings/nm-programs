function y = f(x)
% Approximated function for task 1
% y = exp(x);

% Approximated function for task 2
if (x == 1)
    y = 3;
elseif (x == 2)
    y = 4;
elseif (x == 3)
    y = 1;
elseif (x == 4)
    y = 2;
else
    error("Function undefined for given x");
end

