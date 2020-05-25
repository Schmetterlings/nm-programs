function [T,Z,Y] = NETTO(h,r,endt,endz,boundry0,boundryend)
%setting up the system, defining a, vector t
%vector z and the value output.
a=0.35;
t=0:h:endt;
z=0:r:endz;
s1=size(t);
s2=size(z);
y=zeros(s1(2),s2(2));
%defining the initial condition for the system with function initial
for i=1:1:s2(2)
   y(1,i)=initial(z(i)); 
end
%defining boundry conditions for the system 
for i=1:1:s1(2)
    y(i,1)=boundry0; 
    y(i,s2(2))=boundryend; 
end
%calculationg the next value in time, depending on the steps, previous
%value in time and surrounding values in z dimension according to the net
%method
%leaving the initial and boundry conditions.
for i=2:1:s1(2)
   for k=2:1:s2(2)-1
    y(i,k)=y(i-1,k)+a^2*h*(y(i-1,k+1)-2*y(i-1,k)+y(i-1,k-1))/(r^2);
    end
end
%plotting the contours and 3d plot distinct plots.
figure(1);
contour(z,t,y,'ShowText','on');
figure(2);
mesh(z,t,y);
T=t;
Z=z;
Y=y;
end
