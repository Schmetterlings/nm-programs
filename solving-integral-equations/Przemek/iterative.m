function [xvalue,value] = iterative(a,b,alfa,N,n)
%N is the number of elements while
%n is the number of iterations
dt=(b-a)/(N-1);
x=a:dt:b;
y=zeros(20,N);
sum=0;
for z=2:1:n
    for i=2:1:N
        sum=0;
        for j=1:1:i-1
            sum=sum+k(x(i)-x(j))*y(z-1,j)*dt;
        end
        y(z,i)=alfa*sum+f(x(i));
    end


end
figure(1);
plot(x,y(8:n,:));
value=y(n,:);
xvalue=x;
end

