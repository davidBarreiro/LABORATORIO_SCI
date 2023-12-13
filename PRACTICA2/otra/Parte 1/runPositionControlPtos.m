%Tiempo de muestreo
Ts=100e-3
% Referencia x-y de posicion
refx=10*rand
refy=10*rand
% Ejecutar Simulacion
sim('PositionControlPtos.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;
