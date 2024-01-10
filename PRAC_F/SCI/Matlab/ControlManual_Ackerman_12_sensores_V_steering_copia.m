% Control Manual de vehiculo con lectura de 12 ultrasonidos

clear all;
close all;
rosshutdown

global vel_angular;
global vel_lineal;
global incAngular;
global incLineal;
global vel_angular_max;
global vel_lineal_max;
global stop
global steering_wheel_angle;
global steering_wheel_angle_max;
global vel_lineal_ackerman_kmh;
global vel_lineal_ackerman_kmh_max;


%% CONFIGURACION:
%*************************************************
% Configurar IP del ROS_MASTER (Maquina virtual o Robot real)
ROS_MASTER_IP = '192.168.1.90'

rosinit(ROS_MASTER_IP)

names = categorical({'sonar 00','sonar 01','sonar 02','sonar 03', 'sonar 04','sonar 05','sonar 06','sonar 07','sonar 08','sonar 09','sonar 10','sonar 11'});

%DECLARACION DE PUBLISHERS
%Velocidad
pub_vel=rospublisher('/robot0/cmd_vel','geometry_msgs/Twist');

%%DECLARACIÓN DE SUBSCRIBERS
odom = rossubscriber('/robot0/odom'); % Subscripcion a la odometria
% Subscripcion a los sensores
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


sim('ackerman_ROS_controller_v2.slx')%%%%%%%%


training_data=[];

stop = 0;

%Pausa de 3 segundos para asegurarnos que han llegado datos del simulador
%antes de realizar la lectura 

pause(3);

while (stop==0)

    pos=odom.LatestMessage.Pose.Pose.Position;
    x=pos.X;
    y=pos.Y;
    ori=odom.LatestMessage.Pose.Pose.Orientation;    
    theta=quat2eul([ori.W ori.X ori.Y ori.Z]);
    theta=theta(1);       
    s00= sonar_0.LatestMessage.Range_;
    s01= sonar_1.LatestMessage.Range_;
    s02= sonar_2.LatestMessage.Range_;
    s03= sonar_3.LatestMessage.Range_;
    s04= sonar_4.LatestMessage.Range_;
    s05= sonar_5.LatestMessage.Range_;
    s06= sonar_6.LatestMessage.Range_;
    s07= sonar_7.LatestMessage.Range_;
    s08= sonar_8.LatestMessage.Range_;
    s09= sonar_9.LatestMessage.Range_;
    s10= sonar_10.LatestMessage.Range_;
    s11= sonar_11.LatestMessage.Range_;
        
    medidas_sonar = [s00, s01, s02, s03, s04, s05, s06, s07, s08, s09, s10, s11];
    medidas_sonar(isinf(medidas_sonar)) = 5.0;

 
    %Conversion steering_wheel_angle, linear_vel_ackerman_kmh a V y W
    [vel_lineal, vel_angular] = function_conversion_steering_to_linear_angular(steering_wheel_angle, vel_lineal_ackerman_kmh);

    training_data=[training_data;[medidas_sonar,x,y,theta,vel_angular,vel_lineal, steering_wheel_angle, vel_lineal_ackerman_kmh]];

    msg_vel.Linear.X = vel_lineal;
    msg_vel.Angular.Z = vel_angular;

    stop=ans.flag.signals.values;

    pause(0.1);
end


save datos_entrenamiento training_data



