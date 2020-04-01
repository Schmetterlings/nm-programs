function x = trapezoid(a, b, func)
% Calculates the definite integral using trapezoid rule
% 
% @params:
% a (float) - beginning of the interval
% b (float) - end of the interval
% func (function) - integral function

% @returns:
% x (float) - result of definite integration

% Split into parts
h = (b - a);

nodes(1) = a;
nodes(2) = b;

% Calculate the integral value using Newton-Cotes equation
x = newton_cotes(nodes, 1, func);

syms xi
R = -1/12 * h^3 * diff(func(xi), 2);
fprintf("Trapezoid integration error: %.3f\n", R)

end

