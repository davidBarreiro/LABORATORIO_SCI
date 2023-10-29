% EJERCICIO 1 -- Apartado 1)

% Definición de la función original
syms k
f = 2 + 5*k+ k^2;
disp(f)

% Transformación de la función con la transformada z
ftransz = ztrans(f)
disp(ftransz)

% Representación de las gráficas, original y transformada
figure

subplot(2, 1, 1)
fplot(f)
title("Función original")
xlabel("Eje X")
ylabel("Eje Y")

subplot(2, 1, 2)
fplot(ftransz)
title("Función transformada")
xlabel("Eje X")
ylabel("Eje Y")

 %% 
clear;clc;

% EJERCICIO 1 -- Apartado 2)

% Definición de la función original
syms k
a = 0;
f = sin(k) * exp(-a*k);
disp(f)

% Transformación de la función con la transformada z
ftransz = ztrans(f);
disp(ftransz)

% Representación de las gráficas, original y transformada
figure

subplot(2, 1, 1)
fplot(f)
title("Función original")
xlabel("Eje X")
ylabel("Eje Y")

subplot(2, 1, 2)
fplot(ftransz)
title("Función transformada")
xlabel("Eje X")
ylabel("Eje Y")

%% 
clear; clc;

% EJERCICIO 1 -- Apartado 3)

numerador = [0.4 0 0];
denominador = [1 -1 0.1 0.02];
ftd = tf(numerador, denominador, -1);

% Uso de funciones impulse y step
[y1, tOut1] = impulse(ftd);
[y2, tOut2] = step(ftd);

% Representación de la gráfica
figure
plot(y1, tOut1);
hold on;
plot(y2, tOut2);
hold off;
title('Respuesta del sistema');
legend('Impulso', 'Entrada escalón');

