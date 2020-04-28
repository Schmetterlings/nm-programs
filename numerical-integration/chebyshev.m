function value = chebyshev(a, b, n, func)

x = zeros(1, n);
cheby_nodes = [0.577350 0 0; 0.707107 0 0; 0.794654 0.187592 0; 
                0.832498 0.374541 0; 0.866247 0.422519 0.266635; 
                0.883862 0.529657 0.323912];
%Chebyshev quadrature function
cheby_quadra = @(t) ((a+b)/2)+((a-b)/2)*t;
value = 0;

for i=1:n
    if (i <= n/2)
        x(i) = cheby_quadra(cheby_nodes(n-1, i));
    elseif (i > n/2 && i ~= ((n+1)/2))
        x(i) = cheby_quadra(-1*cheby_nodes(n-1, n+1-i));
    else
        x(i) = cheby_quadra(0);
    end 
    value = value + func(x(i));
end
value = ((b - a) / n) * value;
end

