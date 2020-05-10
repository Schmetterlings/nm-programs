function [value] = Basis(i,x,a,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if(i==1)
    value=1;
else
    if(i==2)
        value=x;
    else
        value=((2*(i-2)+1)*x*Basis(i-1,x,a,b)-(i-2)*Basis(i-2,x,a,b))/(i-1);
    end
end
end

