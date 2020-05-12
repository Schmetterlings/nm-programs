function dy = f(x, y)
  dy = zeros(1, 2);
  dy(1) = y(2);
  dy(2) = -2*y(2) + 20*sin(x) ;
end