% EJERCICIO 3

%{ 
En este ejercicio, se estudiarán en detalle las herramientas que facilita 
Matlab para el diseño y prueba de redes neuronales ejecutando el siguiente 
código de ejemplo:
%}

% Carga de datos de ejemplo disponibles en la toolbox
[inputs,targets] = simplefit_dataset;

% Creación de la red
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);

% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Entrenamiento de la red
[net,tr] = train(net,inputs,targets);

% Prueba
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)

% Visualización de la red
view(net)


% Carga de datos de ejemplo disponibles en la toolbox
[inputs,targets] = bodyfat_dataset;
% Creación de la red
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);
% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 5/100;
% Entrenamiento de la red
[net,tr] = trainscg(net,inputs,targets);
% Prueba
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)
% Visualización de la red
view(net)

% Carga de datos de ejemplo disponibles en la toolbox
[inputs,targets] = bodyfat_dataset;
% Creación de la red
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);
% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 60/100;
net.divideParam.valRatio = 25/100;
net.divideParam.testRatio = 5/100;
% Entrenamiento de la red
[net,tr] = trainlm(net,inputs,targets);
% Prueba
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)
% Visualización de la red
view(net)
