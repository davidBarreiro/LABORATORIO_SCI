
%Tiempo de muestreo
Ts=100e-3
% Referencia x-y de posicion
refx=4;
refy=4;
obsx=1;
obsy=0.5;
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