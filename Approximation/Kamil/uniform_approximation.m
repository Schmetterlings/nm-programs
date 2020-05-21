clc; close all; clear;
syms f(x);
syms W(x);

%paramters
a = -1; %lower band
b = 1; %upperband
order = 3; %polynomial's degree
n = 5; %number of nodal points

%function
f(x) = x^3;

%reszta syfu
W(x) = f(x)-2^(1-order)*Trig(order);
x = a:(b-a)/n:b;

%display syf
disp("Coefficient W =");
disp(simplify(W));
disp("Error = 2^(1-n) =");
disp(2^(1-order));

ezplot(W,[a,b]);
hold on
ezplot(f,[a,b]);
ezplot(Trig(order),[a,b]);
title("visualization of plots nie wazne i tak zmienisz");

function T = Trig(n)
syms x;
    if n == 0
        T = 1;
    elseif n == 1
        T = x;
    else
        T = simplify((2*x*Trig(n-1)-Trig(n-2)));
    end
end
