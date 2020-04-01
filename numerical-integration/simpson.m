function x = simpson(a, b, func)
% Calculates the definite integral using Simpson's rule
% 
% @params:
% a (float) - beginning of the interval
% b (float) - end of the interval
% func (function) - integral function

% @returns:
% x (float) - result of definite integration

% Split into parts
h = (b - a) / 2;

nodes(1) = a;
nodes(2) = a + h;
nodes(3) = b;

% Calculate the integral value using Newton-Cotes equation
x = newton_cotes(nodes, 2, func);

syms xi
R = -1/90 * h^5 * diff(func(xi), 4);
fprintf("Simpson's integration error: %.3f\n", R)

end

