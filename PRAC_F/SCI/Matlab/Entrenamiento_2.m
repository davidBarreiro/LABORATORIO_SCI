%% conectar
%***********************

clear all;
close all;
rosshutdown


rosinit('192.168.1.90')


global steering_wheel_angle;
global vel_lineal_ackerman_kmh;
global s05;
global s06;
global s07;
global s08;
global s10;
global s11;
global x;
global y;
global theta;


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
N=2

Sensores_vec=[];
angVol_vec=[];
velLin_vec=[];
for i=1:N

% Recorrido de aparcamiento para obtener datos de entrenamiento.

sim('ackerman_ROS_controller_v2.slx')

    vel_lineal_ackerman_kmh =  ans.steering.signals.values;  %(km/h)
    steering_wheel_angle =  ans.vel_lineal.signals.values; % desde -90 a 90 grados.
      
    s05=ans.s05.signals.values;
    s06=ans.s06.signals.values;
    s07=ans.s07.signals.values;
    s08=ans.s08.signals.values;
    s10=ans.s10.signals.values;
    s11=ans.s11.signals.values;
    x=ans.x.signals.values;
    y=ans.y.signals.values;
    theta=ans.theta.signals.values;
    theta2 = theta(1, :);
    theta=reshape(theta2,[],1);
        
    medidas_sonar = [s05, s06, s07, s08, s10, s11,x,y,theta];
    medidas_sonar(isinf(medidas_sonar)) = 5.0;

    disp('inicio pausa');
    pause(10)
    disp('fin pausa');

    medidas_sonar = medidas_sonar(1:271,:);
    steering_wheel_angle = steering_wheel_angle(1:271,:);
    vel_lineal_ackerman_kmh = vel_lineal_ackerman_kmh(1:271,:);
  %{
 medidas_sonar = medidas_sonar(1:6,:);
   steering_wheel_angle = steering_wheel_angle(1:6,:);
   vel_lineal_ackerman_kmh = vel_lineal_ackerman_kmh(1:6,:);
  %}

    Sensores_vec=[Sensores_vec;medidas_sonar];

    angVol_vec=[angVol_vec;steering_wheel_angle];
    velLin_vec=[velLin_vec;vel_lineal_ackerman_kmh];

    i
end

    training_data=[Sensores_vec,angVol_vec,velLin_vec];

save datos_entrenamiento training_data


inputs = training_data(:,[1:9])';
outputs = training_data(:,[10,11])';
inputs(isinf(inputs)) = 5.0;
inputs = double(inputs);
outputs = double(outputs);


% Entrenar red neuronal con 10 neuronas en la capa oculta
net = feedforwardnet([10]);
net = configure(net,inputs,outputs);
net = train(net,inputs,outputs); 

% Generar bloque de Simulink con el controlador neuronal
gensim(net)
