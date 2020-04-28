function value = trapezoid(a, b, func)
h = (b - a);

%Newton-Cotes equation
value = (h / 2) * (func(a) + func(b));
end

