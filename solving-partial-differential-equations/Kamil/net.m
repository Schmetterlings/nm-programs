clc; close all; clear;

initial = @(z) sin(pi*z); % Initial condition

a = sqrt(0.35);
h = 0.1;       % Step along 't' axis
r = 0.1;       % Step along 'z' axis
z_max = 1;     % z constraint
t_max = 1;     % t constraint
bound_0 = 0;   % Boundary at 0
bound_max = 0; % Boundary at z_max

t = 0:h:t_max;
z = 0:r:z_max;

len_t = length(t);
len_z = length(z);

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