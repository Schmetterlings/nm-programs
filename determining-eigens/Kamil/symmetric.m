clc; close all; clear;

matrix = [1 1 1; 1 2 3; 1 3 6];
matrix_size = size(matrix);

vectors = [1; 0; 0];

if (matrix_size(1) ~= matrix_size(2))
    error("You can calculate only square matrices.")
end

for i=1:matrix_size(1)
    if (det(matrix(1:i, 1:i)) < 0)
        error("Matrix is not positive definite.")
    end
end

x = ones(1,matrix_size(1)+1);
x(1,matrix_size(1)+1) = 10;
k = 1;

while true
    k=k+1;
    x(k,matrix_size(1)) = 1;
    %fprintf('%i\n', k);
    for i=1:matrix_size(1)-1
        temp = 0;
       for j=1:matrix_size(1)
          temp = temp + matrix(i,j)*x(k-1,j);         
       end
       %temp = temp;
       %x(k-1,matrix_size(1)+1)- x(k-1,matrix_size(1)+1)
       x(k,i) = temp/x(k-1,matrix_size(1)+1);
    end
    temp = 0;
    for i = 1:matrix_size(1) %3
       temp = temp + matrix(matrix_size(1),i)*x(k,i);
    end
    x(k,matrix_size(1)+1) = temp;
    if(k > 2 && abs(x(k,1)-x(k-1,1)) < 0.0001)
        break
    end
    if k > 10
        break
    end
end