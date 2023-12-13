
%Tiempo de muestreo
Ts=100e-3

% Referencia x-y de posicion

% Referencia x-y de posicion
x_0=0.5;
y_0=0.5;
th_0=0;

% Ejecutar Simulacion
sim('PositionControl_tray.slx')

% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;

