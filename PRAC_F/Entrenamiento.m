clear all;clc


% Generar N posiciones aleatorias, simular y guardar en variables
N=30
Sensores_vec=[];
%E_theta_vec=[];
angVol_vec=[];
velLin_vec=[];
%for i=1:N
    %refx=10*rand-5;
    %refy=10*rand-5;
    sim('ackerman_ROS_controller_v2.slx')

    %x=salida_x.signals.values;
    %y=salida_y.signals.values;
   % figure;
    %plot(x,y);
   % grid on;
   % hold on;



    %%%%%Sensores_vec=[E_d_vec;E_d.signals.values];
    %E_theta_vec=[E_theta_vec;E_theta.signals.values];
    %V_vec=[V_vec; V.signals.values];
    %W_vec=[W_vec; W.signals.values];
    %i
%end
%inputs=[E_d_vec'; E_theta_vec'];
%outputs=[V_vec'; W_vec'];
 inputs = training_data(:,[6,7,8,9,11,12]');
outputs = training_data(:,[18,19]);
inputs(isinf(inputs)) = 5.0;
inputs = double(inputs);
outputs = double(outputs);

%Apartado f
% Entrenar red neuronal con 10 neuronas en la capa oculta
net = feedforwardnet([10]);
net = configure(net,inputs,outputs);
net = train(net,inputs,outputs); 

%Apartado g
% Generar bloque de Simulink con el controlador neuronal
gensim(net,Ts)