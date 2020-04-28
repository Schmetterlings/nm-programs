%Bounds and function to calculate integral
a = 2;
b = 7;
funcion = @(x) (x^3+x+4);

result = trapezoid(a, b, funcion);
fprintf("Trapezoid integration value: %.5f\n", result)

result= simpson(a, b, funcion);
fprintf("Simpson integration value: %.5f\n", result)

result = chebyshev(a, b, 7, funcion);
fprintf("Chebyshev integration value: %.5f\n", result)

result = composite_trapezoid(a, b, 2, funcion);
fprintf("Composite quadrature trapezoid value: %.5f\n", result)
