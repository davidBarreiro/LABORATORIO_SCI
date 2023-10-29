% EJERCICIO 4

%{ 
La clasificación de patrones es una de las aplicaciones que dieron origen a
las redes neuronales artificiales. Como en el caso anterior, la toolbox de 
redes neuronales de Matlab dispone de una red optimizada para la 
clasificación, patternnet, que analizaremos en este ejemplo.


% Carga de datos de ejemplo disponibles en la toolbox
[inputs,targets] = simpleclass_dataset;

% Creción de una red neuronal para el reconocimiento de patrones
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);

% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Entrenamiento de la red
[net,tr] = train(net,inputs,targets);

% Prueba
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

% Visualización
view(net)


% Carga de datos de ejemplo disponibles en la toolbox
[inputs,targets] = cancer_dataset;

% Creción de una red neuronal para el reconocimiento de patrones
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);

% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Entrenamiento de la red
[net,tr] = train(net,inputs,targets);

% Prueba
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

% Visualización
view(net)
%}

% Carga de datos de ejemplo disponibles en la toolbox
[inputs,targets] = cancer_dataset;

% Creción de una red neuronal para el reconocimiento de patrones
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);

% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 50/100;
net.divideParam.valRatio = 25/100;
net.divideParam.testRatio = 25/100;

% Entrenamiento de la red
[net,tr] = train(net,inputs,targets);

% Prueba
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

% Visualización
view(net)