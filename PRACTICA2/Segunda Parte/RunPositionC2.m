
%Tiempo de muestreo
Ts=100e-3
% Referencia x-y de posicion
refx=3;
refy=3;
obsx=15;
obsy=15;
%obsx=1.1421;
%obsy=0.6158;
% Ejecutar Simulacion
sim('EvitarObstaculo.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;
plot(obsx,obsy,'m-o');