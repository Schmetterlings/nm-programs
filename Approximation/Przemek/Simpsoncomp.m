function [value] = Simpsoncomp(a,b,func)
    step=(b-a)/1000;
    sum=0;
    for i=a:2*step:b-2*step
        sum=sum+func(i)+4*func(i+step)+func(i+2*step);
    end

    value=(step/3)*(sum);
end