function value= simpson(a, b, func)

h = (b - a) / 2;

%Newton-Cotes equation
value = (h / 3) * (func(a) + 4 * func(a+h) + func(b));
end

