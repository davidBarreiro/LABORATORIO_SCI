
%Tiempo de muestreo
Ts=100e-3

% Referencia x-y de posicion

% Referencia x-y de posicion
x_0=0.1;
y_0=0.1;
th_0=0;
%refx=abs(10*rand-5);
%refy=abs(10*rand-5);
% Ejecutar Simulacion
sim('PositionControl.slx')

% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;

