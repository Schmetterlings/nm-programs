A = [1 1 1;1 2 3; 1 3 6];
n = size(A,1);
x = ones(n,n);
lambda = zeros(n,1);
if(A(1,1)<=0 || det(A(1:2,1:2))<=0 || det(A)<=0)
    error("Matrix isn't positive definite")
end

for i = 1:n*n
    lambda(1) = (A(3,1)*x(1,1)+A(3,2)*x(1,2)+A(3,3)*x(1,3))/x(1,3);
    x(1,2) = (A(2,1)*x(1,1)+A(2,2)*x(1,2)+A(2,3)*x(1,3))/lambda(1); 
    x(1,1) = (A(1,1)*x(1,1)+A(1,2)*x(1,2)+A(1,3)*x(1,3))/lambda(1);
end

fprintf("Lambda1: %.6f, x1: %.6f, x2: %.6f, x3: %.6f\n", lambda(1), x(1,1), x(1,2), x(1,3))

for i = 1:n*n
    lambda(2) = (A(3,1)*x(2,1) + A(3,2)*x(2,2) + A(3,3)*((-1*x(1,1)*x(2,1))+(-1*x(1,2)*x(2,2))))/((-1*x(1,1)*x(2,1))-(x(1,2)*x(2,2))); 
    x(2,1) = (A(1,1)*x(2,1)+A(1,2)*x(2,2)+A(1,3)*((-1*x(1,1)*x(2,1))+(-1*x(1,2)*x(2,2))))/lambda(2);
end

x(2,3) = (-1*x(1,1)*x(2,1))+(-1*x(1,2)*x(2,2));
[M,I] = max(abs(x(2,:)));
x(2,:) = x(2,:)./x(2,I);
fprintf("Lambda2: %.6f, x1: %.6f, x2: %.6f, x3: %.6f\n", lambda(2), x(2,1), x(2,2), x(2,3))
A1 = [x(1,2) x(1,3); x(2,2) x(2,3)];
B = [-1*x(1,1);-1*x(2,1)];
solution = linsolve(A1,B);
x(3,2:end) = solution;
lambda(3) = (A(3,1)+A(3,2)*x(3,2)+A(3,3)*x(3,3))/x(3,3);
[M,I] = max(abs(x(3,:)));
x(3,:) = x(3,:)./x(3,I);

fprintf("Lambda3: %.6f, x1: %.6f, x2: %.6f, x3: %.6f\n", lambda(3), x(3,1), x(3,2), x(3,3))
