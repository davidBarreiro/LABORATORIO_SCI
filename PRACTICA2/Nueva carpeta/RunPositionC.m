
%Tiempo de muestreo
Ts=100e-3
% Referencia x-y de posicion
%refx=1.3236;
%refy=-4.0246;
%refx=10*rand-5;
%refy=10*rand-5;
% Ejecutar Simulacion
sim('PositionControl_0.slx')

% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;
