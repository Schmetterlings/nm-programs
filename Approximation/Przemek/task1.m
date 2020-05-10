function [coefficients,distance] = task1(a,b,n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
ak=zeros(n+1,1);
bk=zeros(n+1,1);
sum=0;
for i=1:1:n+1
    bkfunction=@(x)weight(x)*(Basis(i,x,a,b))^2;
    bk(i)=Simpsoncomp(a,b,bkfunction);
    akfunction=@(x)weight(x)*Basis(i,x,a,b)*f(x);
    ak(i)=Simpsoncomp(a,b,akfunction)/bk(i);
    sum=sum+ak(i)*ak(i)*bk(i);
end

distancefunction=@(x)weight(x)*(f(x))^2;
coefficients=ak;
distance=Simpsoncomp(a,b,distancefunction)-sum;

x=a:(b-a)/100:b
y1=f(x);
for j=1:1:101
    y2(j)=0;
    for i=1:1:n+1
        y2(j)=y2(j)+ak(i)*Basis(i,x(j),a,b);
    end
    
end
plot(x,y1,x,y2)

end

