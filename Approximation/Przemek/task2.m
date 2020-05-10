function [coefficients,distance] = task2(a,b,n,N)
x=a:(b-a)/(N):b
A=zeros(n+1);
B=zeros(n+1,1);

for j=1:1:n+1
    for i=1:1:n+1
        A(i,j)=S(N,x,i+j-2);
    end
    B(j)=T(N,x,j-1);
    
end
coefficients=Gauss(A,B);
sum=0;
   for j=1:1:N+1
    sum=sum+(f(x(j))-W(x(j),coefficients))^2;
   end
   distance=sqrt(sum);
end

function [output] = S(N,x,m)
   sum=0;
   for j=1:1:N+1
    sum=sum+x(j)^m;
   end
    output=sum;
end
function [output] = T(N,x,k)
     sum=0;
   for j=1:1:N+1
    sum=sum+f(x(j))*(x(j))^k;
   end
    output=sum;
end

function [output] = W(x,coeff)
s1=size(coeff,1);
sum=0;
    for i=1:1:s1
        sum=sum+x^(i-1)*coeff(i);
    end
    output=sum;
end
