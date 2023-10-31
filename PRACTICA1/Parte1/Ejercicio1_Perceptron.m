
% EJERCICIO 1

% Se desea clasificar un conjunto de datos pertenecientes a cuatro clases 
% diferentes. Los datos y las clases a las que pertenecen con los que se
% muestra a continuación:


%Los dos vectores de entrada
P=[0.1 0.7 0.8 0.8 1.0 0.3 0.0 -0.3 -0.5 -1.5;
1.2 1.8 1.6 0.6 0.8 0.5 0.2 0.8 -1.5 -1.3];

%Los dos veectores objetivos
T=[1 1 1 0 0 1 1 1 0 0; 0 0 0 0 0 1 1 1 1 1];

%Creación de una red de perceptrón:
net = perceptron;

%Entrenamiento de la red de perceptrón entrena la red de perceptrón net con
% los datos de entrada P y los objetivos de salida T. La red de perceptrón 
% se entrena para aprender una función de decisión que separe los ejemplos 
% de entrada en dos clases, de acuerdo con los objetivos de salida
% proporcionados en T.
net = train(net,P,T);

%Visualización de la línea de decisión del perceptrón
plotpv(P,T);

%raza la línea de decisión aprendida por la red de perceptrón después del 
% entrenamiento. net.iw{1,1} representa los pesos de entrada y net.b{1} 
% representa el sesgo del perceptrón. La línea de decisión divide el espacio
% de entrada en dos regiones, que corresponden a las dos clases binarias.
plotpc(net.iw{1,1},net.b{1});

%La red los puede separar ya que el problema planteado es linelamente 
%independiente
%tiene 2 neuronas de salida, una para cada clase binaria

%{

%Los dos nuevos vectores de entrada
P=[0.1 0.7 0.8 0.8 1.0 0.3 0.0 -0.3 -0.5 -1.5 0.0;
1.2 1.8 1.6 0.6 0.8 0.5 0.2 0.8 -1.5 -1.3 -1.5];

%Los dos veectores objetivos
T=[1 1 1 0 0 1 1 1 1 0 0; 0 0 0 0 0 1 1 1 1 1 1];

net = perceptron;

%Entrenamiento de la red de perceptrón entrena la red de perceptrón net con
% los datos de entrada P y los objetivos de salida T. La red de perceptrón 
% se entrena para aprender una función de decisión que separe los ejemplos 
% de entrada en dos clases, de acuerdo con los objetivos de salida
% proporcionados en T.
net = train(net,P,T);

%Visualización de la línea de decisión del perceptrón
plotpv(P,T);
plotpc(net.iw{1,1},net.b{1});
%El segundo caso no es linealmente inependiente
%}
