clear all;clc
%Apartado b
%Tiempo de muestreo
Ts=100e-3
% Referencia x-y de posicion
refx=2;
refy=2;
%refx=2
%refy=2
% Ejecutar Simulacion
sim('PositionControl.slx')

%Apartado c
E_d 
E_theta
V
W

%Apartado d
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;
