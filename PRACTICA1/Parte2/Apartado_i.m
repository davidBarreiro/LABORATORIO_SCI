clear all;clc

%Tiempo de muestreo
Ts=100e-3

%Apartado i
% Generar N posiciones aleatorias, simular y guardar en variables
N=5
for i=1:N
    refx=10*rand-5;
    refy=10*rand-5;
    sim('PositionControl.slx')
    i
end
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;


J=5
for i=1:J
    refx=10*rand-5;
    refy=10*rand-5;
    sim('PositionControlNet.slx')
    i
end
x2=salida_x.signals.values;
y2=salida_y.signals.values;
figure;
plot(x2,y2);
grid on;
hold on;