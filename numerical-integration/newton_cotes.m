function x = newton_cotes(nodes, n, func)
% Evaluate the integral value using different formulas.
% 
% @params:
% nodes (vector) - vector containing all grid nodes
% n (int) - degree of Newton-Cotes formula
% func (function) - integral function

% @returns:
% x (float) - result of definite integration

switch n
    case {1} % Trapezoid rule
        h = nodes(end) - nodes(1);
        x = (h / 2) * (func(nodes(1)) + func(nodes(2)));
        
    case {2} % Simpson's rule
        h = (nodes(end) - nodes(1)) / 2;
        x = (h / 3) * (func(nodes(1)) + 4 * func(nodes(2)) + func(nodes(3)));
        
    otherwise
        error("Not supported degree of Newton-Cotes formula")
end
end