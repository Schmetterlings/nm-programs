A = [1 1 1;1 2 3; 1 3 6];
n = size(A,1);
All_y = zeros(n,n+1);
y = zeros(n,1);
y(1, 1) = 1;
All_y(:,1)= y;

for i=2:1:n+1  
   y = A * y;
   All_y(:,i)= y;
   if(i==n+1)
       All_y(:,i)=-y;
   end    
end

if(rank(All_y)<n)
   error('Matrix has infineatly many solutions')
end

B = All_y;
for i = 1 : n
    if(B(i,i) == 0)
      [M,I] = max(B); 
      a = B(i,:);
      B(i,:) = B(I(i),:);
      B(I(i),:) = a;
    end
    B(i,:) = B(i,:) / B(i,i);
    for j = i + 1 : n
       B(j,:) = B(j,:) - B(i,:) * B(j,i);    
    end
end
%Change last column of matrix B
%to proper x value
for i = n : -1 : 2
    for j = i - 1 : -1 : 1
     B(j,end) = B(j,end) - B(i,end) * B(j,i);
    end    
end

for i=1:n   
    p(i) = B(n+1-i,n+1);
end

lambda = roots([1 p]);
lambda_size = size(lambda,1);
x = zeros(n,lambda_size);

for i=1:lambda_size
g = zeros(n,1);
g(n) = 1;
for j=n-1:-1:1   
    g(j) = g(j+1) * lambda(i) + g(n) * p(n-j);
end

for j=1:n   
   x(:,i) = g(j) * All_y(:,j) + x(:,i);
end
end
x
norm_x = x;
for i = 1 : n
[M,I] = max(abs(x(:,i)));
norm_x(:,i) = norm_x(:,i)/norm_x(I, i);
end
norm_x



