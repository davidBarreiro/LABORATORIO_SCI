clear; % Comando para limpiar las variables creadas
clc; % Comando para limpiar el Command Window

% 1) Matriz A y vector v

A = [1 2 ; 3 4 ; 5 6 ; 7 8];
v = [14 ; 16 ; 18 ; 20];

% Matriz B concatenando A y v

B = [A v];

% Vector fila, concatenando las fiolas de la matriz B

vfila = [B(1,:) B(2,:) B(3,:) B(4,:)]
vColumna = [B(:,1) ; B(:,2) ; B(:,3)]