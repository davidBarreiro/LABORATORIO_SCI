%Tiempo de muestreo
Ts=100e-3;
% Referencia x-y de posicion
x_0=0.1;
y_0=0.1;
th_0=0;

obsx=4;
obsy=0.5;

% Ejecutar Simulacion
sim('EvitarObstaculoTray.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
xtray=salida_xtray.signals.values;
ytray=salida_ytray.signals.values;
figure;
plot(x,y);
grid on;
hold on;
plot(xtray,ytray);
plot(obsx,obsy,"rx")