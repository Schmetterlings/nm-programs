A = [1 1 1;1 2 3; 1 3 6];
n = size(A,1);
All_y = zeros(n,n*n);
y = zeros(n,1);
y(1, 1) = 1;
All_y(:,1)= y;

for i=2:1:n*n  
   y = A * y;
   All_y(:,i)= y;
   if(i==n+1)
       All_y(:,i)=-y;
   end    
end
All_y

lambda = (sum(All_y(:,end)./All_y(:,end-1)))/n
x = All_y(:,end)
norm_x = x;
[M,I] = max(abs(x));
norm_x = norm_x./norm_x(I)
