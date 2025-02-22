clc;
clear;
close all;

r = 1;
theta = linspace(0, 2*pi, 100);
phi = linspace(0, pi, 50);
[Theta, Phi] = meshgrid(theta, phi);
X = r * sin(Phi) .* cos(Theta);
Y = r * sin(Phi) .* sin(Theta);
Z = r * cos(Phi);

figure
surf(X, Y, Z, 'FaceColor', [0.9, 0.9, 0.9], 'EdgeColor', 'none');
hold on;

light('Position', [1, 1, 2], 'Style', 'local');
lighting gouraud;
material shiny;

axis equal;
# set(gca, 'Color', [1, 1, 1]);
view(30, 30);
axis off;

print('pearl.png','-dpng','-r300');
