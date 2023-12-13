
%Tiempo de muestreo
Ts=100e-3
% Referencia x-y de posicion
refx=-2;
refy=2;
%obsx=1.1421;
%obsy=0.6158;
% Ejecutar Simulacion
sim('PositionControl_1.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;
