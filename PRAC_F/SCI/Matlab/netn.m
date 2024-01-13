inputs = training_data(:,[1:12])';
outputs = training_data(:,[13:14])';
inputs(isinf(inputs)) = 5.0;
inputs = double(inputs);
outputs = double(outputs);


% Entrenar red neuronal con 10 neuronas en la capa oculta
net = feedforwardnet([8]);
net = configure(net,inputs,outputs);
net = train(net,inputs,outputs); 

% Generar bloque de Simulink con el controlador neuronal
gensim(net)
