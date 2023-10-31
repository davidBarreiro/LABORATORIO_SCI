% EJERCICIO 2

%{ 
Una de las aplicaciones inmediatas de las redes neuronales es la aproximación
de funciones. Para ello, Matlab dispone de una red optimizada, fitnet, con 
la que se trabajará en este ejercicio. El objetivo en este caso es aproximar
la función 𝑓 = 𝑠𝑖𝑛𝑐(𝑡) tal y como se muestra a continuación:
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APROXIMACIÓN DE FUNCIONES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all;

% DEFINICIÓN DE LOS VECTORES DE ENTRADA-SALIDA
% ============================================

t = -3:.1:3; % eje de tiempo
F = sinc(t)+.001*randn(size(t)); % función que se desea aproximar

plot(t,F,'+');
title('Vectores de entrenamiento');
xlabel('Vector de entrada P');
ylabel('Vector Target T');

% DISEÑO DE LA RED
% ==================
% Valores a cambiar: hiddenLayerSize y tipo de entrenamiento
hiddenLayerSize = 4;
net = fitnet(hiddenLayerSize,'trainrp');

net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net = train(net,t,F);

Y=net(t);

plot(t,F,'+'); hold on;
plot(t,Y,'-r'); hold off;
title('Vectores de entrenamiento');
xlabel('Vector de entrada P');
ylabel('Vector Target T');

