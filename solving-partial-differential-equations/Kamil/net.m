clc; close all; clear;

initial = @(z) sin(pi*z); % Initial condition
exact = @(a, t, z) exp(-pi^2 * a^2 * t) * sin(pi*z); % Exact solution

a = sqrt(0.2);
h = 0.4;       % Step along 't' axis
r = 0.2;       % Step along 'z' axis
z_max = 1;     % z constraint
t_max = 3;     % t constraint
bound_0 = 0;   % Boundary at 0
bound_max = 0; % Boundary at z_max

t = 0:h:t_max;
z = 0:r:z_max;

len_t = length(t);
len_z = length(z);

exact_sol = zeros(1, len_z);
w = zeros(len_t, len_z);

for i=1:len_z
    w(1, i) = initial(z(i));
end

for i=1:len_z
    w(i, 1) = bound_0;
    w(i, len_z) = bound_max;
end

for i=2:len_t
    for k=2:len_z-1
        w(i, k) = w(i-1, k) + a^2 * h * (w(i-1, k+1) - 2 * w(i-1, k) + w(i-1, k-1)) / (r^2);
    end
end

for i=1:len_z
    exact_sol(i) = exact(a, t(i), z(i));
end

mse = sqrt(mean((exact_sol - w).^2));
disp(mse)

c_plot = figure(1);
contour(z, t, w);
xlabel('z');
ylabel('t');
title("Contour plot");
saveas(c_plot, 'contour.png');

m_plot = figure(2);
mesh(z, t, w);
xlabel('z');
ylabel('t');
zlabel('w');
title("3D plot");
saveas(m_plot, '3d.png');