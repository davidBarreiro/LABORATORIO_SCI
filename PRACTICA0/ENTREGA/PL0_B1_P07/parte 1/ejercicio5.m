[X, Y] = meshgrid(-5:5);
Z = Y*sin(pi*(X/10)) + 5*cos((X.^2 + Y.^2)/8) + cos(X + Y)*cos(3*X - Y);

f = figure;
% Primera gráfica
subplot(2, 2, 1:2);
surf(X, Y, Z);
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');
title('Gráfica de Superficie', 'FontSize', 15);
% Segunda gráfica
subplot(2, 2, 3);
mesh(X, Y, Z);
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');
title('Gráfica de Malla', 'FontSize', 15);
% Tercera gráfica
subplot(2, 2, 4);
contourf(X, Y, Z);
colorbar;
xlabel('Eje X');
ylabel('Eje Y');
title('Gráfica de Contorno', 'FontSize', 15);
