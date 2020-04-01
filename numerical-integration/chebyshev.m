function x = chebyshev(a, b, n, func)
% Calculates the definite integral using Chebyshev's method
% 
% @params:
% a (float) - beginning of the interval
% b (float) - end of the intervalin
% n (int) - number of Chebyshev nodes
% func (function) - integral function

% @returns:
% x (float) - result of definite integration

nodes = zeros(1, n);
quadrature = @(t) ((a + b) / 2) + ((a - b) / 2) * t;

switch n
    case {2}
        nodes(1) = quadrature(-0.577350);
        nodes(2) = quadrature(0.577350);
        
    case {3}
        nodes(1) = quadrature(0.707107);
        nodes(2) = quadrature(0.0);
        nodes(3) = quadrature(-0.707107);
        
    case {4}
        nodes(1) = quadrature(0.794654);
        nodes(2) = quadrature(0.187592);
        nodes(3) = quadrature(-0.187592);
        nodes(4) = quadrature(-0.794654);
    
    case {5}
        nodes(1) = quadrature(0.832498);
        nodes(2) = quadrature(0.374541);
        nodes(3) = quadrature(0.0);
        nodes(4) = quadrature(-0.374541);
        nodes(5) = quadrature(-0.832498);
        
    case {6}
        nodes(1) = quadrature(0.866247);
        nodes(2) = quadrature(0.422519);
        nodes(3) = quadrature(0.266635);
        nodes(4) = quadrature(-0.266635);
        nodes(5) = quadrature(-0.422519);
        nodes(6) = quadrature(-0.866247);
        
    case {7}
        nodes(1) = quadrature(0.883862);
        nodes(2) = quadrature(0.529657);
        nodes(3) = quadrature(0.323912);
        nodes(4) = quadrature(0.0);
        nodes(5) = quadrature(-0.323912);
        nodes(6) = quadrature(-0.529657);
        nodes(7) = quadrature(-0.883862);
        
    otherwise 
        error("Not supported number of Chebyshev nodes")
end

x = 0;
for i=1:n
    x = x + func(nodes(i));
end
x = ((b - a) / n) * x;

end

