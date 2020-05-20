function y = polynomial(i, x)
if (i == 1)
    y = 1;
elseif (i == 2)
    y = x;
else
    % Legendre polynomials of arbitrary degree can be obtained by using
    % the following recurrent relation
    y = ((2*(i-2)+1)*x*polynomial(i-1, x)-(i-2)*polynomial(i-2, x))/(i-1);
end