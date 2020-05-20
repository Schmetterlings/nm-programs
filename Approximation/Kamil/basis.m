function y = basis(i, x)
% You may need to add parameters a, b depending on your 
% system of basis functions
if (i == 1)
    y = 1;
elseif (i == 2)
    y = x;
else
    % Legendre polynomials of arbitrary degree can be obtained by using
    % the following recurrent relation
    y = ((2*(i-2)+1)*x*basis(i-1, x)-(i-2)*basis(i-2, x))/(i-1);
end