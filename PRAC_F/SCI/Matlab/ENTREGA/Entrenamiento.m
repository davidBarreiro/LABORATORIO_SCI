%% conectar
%***********************

clear all;
close all;
rosshutdown

rosinit('192.168.1.90')

global steering_wheel_angle;
global vel_lineal_ackerman_kmh;
global s00;
global s01;
global s02;
global s03;
global s04;
global s05;
global s06;
global s07;
global s08;
global s09;
global s10;
global s11;


%% ini_simulador_ACKERMAN
%***********************

%DECLARACIÓN DE SUBSCRIBERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Odometria
sub_odom=rossubscriber('/robot0/odom');
%Laser
%sub_laser = rossubscriber('/robot0/laser_1', rostype.sensor_msgs_LaserScan);
%Sonars

sonar_0 = rossubscriber('/robot0/sonar_0', rostype.sensor_msgs_Range);
sonar_1 = rossubscriber('/robot0/sonar_1', rostype.sensor_msgs_Range);
sonar_2 = rossubscriber('/robot0/sonar_2', rostype.sensor_msgs_Range);
sonar_3 = rossubscriber('/robot0/sonar_3', rostype.sensor_msgs_Range);
sonar_4 = rossubscriber('/robot0/sonar_4', rostype.sensor_msgs_Range);
sonar_5 = rossubscriber('/robot0/sonar_5', rostype.sensor_msgs_Range);
sonar_6 = rossubscriber('/robot0/sonar_6', rostype.sensor_msgs_Range);
sonar_7 = rossubscriber('/robot0/sonar_7', rostype.sensor_msgs_Range);
sonar_8 = rossubscriber('/robot0/sonar_8', rostype.sensor_msgs_Range);
sonar_9 = rossubscriber('/robot0/sonar_9', rostype.sensor_msgs_Range);
sonar_10 = rossubscriber('/robot0/sonar_10', rostype.sensor_msgs_Range);
sonar_11 = rossubscriber('/robot0/sonar_11', rostype.sensor_msgs_Range);

%DECLARACIÓN DE PUBLISHERS
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad
pub_vel=rospublisher('/robot0/cmd_vel','geometry_msgs/Twist');

%GENERACION DE MENSAJES
%%%%%%%%%%%%%%%%%%%%%%%
msg_vel=rosmessage(pub_vel);

%Definimos la periodicidad del bucle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=robotics.Rate(10);

%Nos aseguramos de recibir un mensaje relacionado con el robot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while (strcmp(sub_odom.LatestMessage.ChildFrameId,'robot0')~=1)
     sub_odom.LatestMessage
end

disp('Inicialización ACKERMAN finalizada correctamente');

%% ***********************


training_data=[];

%numero de maniobras para entreno
N=10
%Vectores para almacenar los datos de entrenamiento
Sensores_vec=[];
angVol_vec=[];
velLin_vec=[];
%Bucle para crear los datos de entrenamiento
for i=0:N

% Recorrido de aparcamiento para obtener datos de entrenamiento con 
% controlador borroso.

sim('ackerman_ROS_controller_v2_training.slx')

%recogida de los datos desde simulink

    %velocidad lineal y giro de volante
    vel_lineal_ackerman_kmh =  ans.steering.signals.values;  %(km/h)
    steering_wheel_angle =  ans.vel_lineal.signals.values; % desde -90 a 90 grados.
    
    %sensores del robot
    s00=ans.s00.signals.values;
    s01=ans.s01.signals.values;
    s02=ans.s02.signals.values;
    s03=ans.s03.signals.values;
    s04=ans.s04.signals.values;
    s05=ans.s05.signals.values;
    s06=ans.s06.signals.values;
    s07=ans.s07.signals.values;
    s08=ans.s08.signals.values;
    s09=ans.s09.signals.values;
    s10=ans.s10.signals.values;
    s11=ans.s11.signals.values;
    
    %Matriz que recoge los valores de todos los sensores
    medidas_sonar = [s00, s01, s02, s03, s04, s05, s06, s07, s08, s09, s10, s11];
    medidas_sonar(isinf(medidas_sonar)) = 5.0;

    %pausa para cerrar y reiniciar el mapa de entrenamiento
    disp('inicio pausa');
    pause(10)
    disp('fin pausa');
    
    %Acotamos el numero de filas para que siempre sean las mismas
    medidas_sonar = medidas_sonar(1:271,:);
    steering_wheel_angle = steering_wheel_angle(1:271,:);
    vel_lineal_ackerman_kmh = vel_lineal_ackerman_kmh(1:271,:);

    %Almacenamos todos los valores de los sensores a los anteriores
    Sensores_vec=[Sensores_vec;medidas_sonar];
    
    %Almacenamos todos los valores de velocidad y giro de volantes a los 
    %ya almacenados
    angVol_vec=[angVol_vec;steering_wheel_angle];
    velLin_vec=[velLin_vec;vel_lineal_ackerman_kmh];

end

%Se almacenan todos las matrices de valores en training data
training_data=[Sensores_vec,velLin_vec,angVol_vec];

save datos_entrenamiento training_data

%Generamos los valores de entrada de la nn con los sensores
inputs = training_data(:,[1:12])';
%Generamos los valores de salida de la nn con la velocidad y el giro
outputs = training_data(:,[13:14])';
inputs(isinf(inputs)) = 5.0;
inputs = double(inputs);
outputs = double(outputs);


% Entrenar red neuronal con 8 neuronas en la capa oculta
net = feedforwardnet([8]);
net = configure(net,inputs,outputs);
net = train(net,inputs,outputs); 

% Generar bloque de Simulink con el controlador neuronal
gensim(net)
