clear all;clc

%Tiempo de muestreo
Ts=100e-3

%Apartado i
% Generar N posiciones aleatorias, simular y guardar en variables
N=2
E_d_vec=[];
E_theta_vec=[];
refx_vec=[];
refy_vec=[];
for i=1:N
    refx=10*rand-5;
    refy=10*rand-5;
    sim('PositionControl.slx')
    E_d_vec=[E_d.signals.values];
    E_theta_vec=[E_theta.signals.values];
    refx_vec=[refx];
    refy_vec=[refy];
    i
end
f = figure;
plot(refx_vec, 'o-r');
hold on
plot(refy_vec, 'o-b');
plot(E_d_vec, 'm-o');
plot(E_theta_vec, 'o-k');
hold off
title('Gráfica')
xlabel('Filas de la matriz')
ylabel('Valores de la matriz')
%{
inputs=[E_d_vec'; E_theta_vec'];
outputs=[V_vec'; W_vec'];
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
%}