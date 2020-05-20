function f = composite(a, b, m, func)
h = (b - a) / m;

f = func(a) + func(b);

for i=2:m
    f = f + 2*func(a+(i-1)*h);
end

syms xi
f = f * (b - a) / (2 * m);
end