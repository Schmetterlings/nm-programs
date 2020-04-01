clear; clc;

a = 1;
b = 4;

func1 = @(x) x^2 - x + 1;
func2 = @(x) sin(x) + 2;
func3 = @(x) (x^2)/2 + cos(x)/2; 

t = trapezoid(a, b, func1);
s = simpson(a, b, func1);