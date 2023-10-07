%clear A sirve para borrar la varibale A del workspace
%clear all borra todas las variables del workspace
%close cierra un script

clear all
%Ejercicio 1. Matrices y vectores.
%Realice un script de Matlab que permita desarrollar una serie de operaciones con una matriz:
%1. Cree la siguiente matriz A y el vector v:
%{
A = [1 2; 3 4; 5 6; 7 8]
v = [14 ; 16 ; 18 ;20]

%2. Obtenga y visualice una matriz B concatenando la matriz A y el vector v.
B = [A v]

%3. Obtenga y visualice un vector fila resultado de concatenar las filas de la matriz B.

vfila = [B(1,:) B(2,:) B(3,:) B(4,:)]

%4. Obtenga y visualice un vector columna resultado de concatenar las columnas de la matriz B.

vColumna = [B(:,1)' B(:,2)' B(:,3)']'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ejercicio 2. Matrices y vectores.

%Realice un script de Matlab que permita desarrollar una serie de operaciones con una matriz:

%1. El script ha de generar una matriz, cuadrada y aleatoria de tamaño indicado por el usuario. En la
%línea de comandos se ha de visualizar el mensaje: “Indique el tamaño de la matriz”.
%Algunas funciones útiles: input, rand.

dim = input("Indique el tamaño de la matriz: ")

matriz_aleatoria = [rand(dim)]; 

%2. A partir de la matriz construida, el script deberá calcular y presentar por pantalla los siguientes datos:

%a) Matriz generada.
disp(matriz_aleatoria)

%b) Una segunda matriz formada por las columnas impares de la matriz inicial
rango = ceil(dim/2);
iter = 1;

for i = 1:rango
        matriz_impar(i,:)= matriz_aleatoria(iter,:);
        iter=iter+2;
end 
matriz_impar

%c) El valor de los elementos de la diagonal de la matriz generada.

mat_diagonal(1,:) = diag(matriz_impar)

%d) Valor máximo, mínimo, medio y varianza de cada fila. Estos valores se han de representar
%gráficamente, indicando en el eje de abscisas el número de fila

for i = 1:rango
        maximos(:,i)= max(matriz_impar(i,:));
        minimos(:,i)= min(matriz_impar(i,:));
        medias(:,i)= mean(matriz_impar(i,:));
        varianza(:,i)= var(matriz_impar(i,:));
end 

maximos
minimos
medias
varianza

figure
X=1:rango;
%graficamos los maximos con x azules
plot(X,maximos,'bx')
title('Tabla Pruebas')
xlabel('filas')
ylabel('valores')
hold on;
%graficamos los minimos con x rojas
plot(X,minimos,'r*')
hold on;
%graficamos las medias con circulos verdes
plot(X,medias,'go')
hold on;
%graficamos las varianza con circulos magenta
plot(X,varianza,'mo')

hold off;

%close;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ejercicio 3. Matrices y vectores.
%Programe un script en Matlab que permita realizar una serie de operaciones con dos matrices (A y B)
%que se introducirán por teclado. Para ello:
%1. Solicite al usuario las dimensiones de las matrices en formato [filas cols], (si se introduce un único
%número, la matriz será cuadrada).

dim3 = size(PideDimension())

%2. Genere dos matrices (A y B) de las dimensiones elegidas. Para rellenar las matrices, escriba una
%función en Matlab (en un fichero diferente) que reciba como parámetro las dimensiones deseadas
%[filas cols], y devuelva la matriz rellena.
%function Matriz = IntroducirMatriz(Dimensiones);

MatrizA = IntroducirMatriz(dim3);

MatrizB = IntroducirMatriz(dim3);

%3. La función debe pedir datos al usuario para cada posición de la matriz. En caso de que el usuario
%escriba %r’, la matriz se rellenará de valores aleatorios

MatrizC = PideMatriz(dim3)


%4. Calcule y muestre por pantalla:

%• Las matrices generadas A y B

MatrizA
MatrizB 

%• La transpuesta e inversa de cada una de las matrices

MatrizAt=MatrizA'

MatrizBt=MatrizB' 

MatrizAi = invertida(MatrizA)

MatrizBi = invertida(MatrizB)

detA = deterMatriz(MatrizA)

detBi = deterMatriz(MatrizB)


%• El valor del determinante y el rango de cada una de las matrices

rangoA = rank(MatrizA)

rangoi = rank(MatrizB)

%• El producto de A y B (matricial y elemento a elemento)

[dim_fA, dim_cA] = size(MatrizA);
[dim_fB, dim_cB] = size(MatrizB);

if dim_cA == dim_fB

MatrizM = MatrizA*MatrizB

else
 disp("Las matrices no pueden hacer el producto matricial ya que no tienen dimensiones compatibles")
end

MatrizE = MatrizA.*MatrizB

%• Un vector fila obtenido concatenando la primera fila de cada una de las matrices

vectF = [MatrizA(1,:) MatrizB(1,:)]

%• Un vector columna obtenido concatenando la primera columna de cada una de las matrices

vectC = [MatrizA(:,1)' MatrizB(:,1)']'

%En caso de que no sea posible realizar alguno de los cálculos solicitados, indíquelo por pantalla.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ejercicio 4. Tiempo de cómputo y representación gráfica
%Realice un script en Matlab que permita obtener y representar el tiempo consumido para el cálculo del
%rango y el determinante de una matriz en función de su tamaño (entre 1x1 y 25x25). Tenga en cuenta
%que:
%• La matriz se rellenará con valores aleatorios.

for i = 1:25
    matrices{1,i} = IntroducirMatriz([i,i])
end

%• El tiempo necesario para cada operación debe obtenerse por separado.

for i = 1:25
    tiemposdet(1,i) = detTiempo(matrices{1,i})
    tiemposRango(1,i) = rangoTiempo(matrices{1,i})
end

%• Los tiempos de procesamiento para el cálculo del rango y del determinante se representarán en
%la misma gráfica, utilizando para ello diferentes colores.
%• Deben añadirse etiquetas a los ejes, y una leyenda indicando que representa cada línea.

figure
X=1:1:25
Y=tiemposRango
Z=tiemposdet
%graficamos los tiempos de rangos con x azules
plot(X,Y,'bx')
xticks(0:1:25);
yticks(0:0.0001:0.5)
title('Tabla Tiempos')
xlabel('matrices')
ylabel('tiempos')
hold on;
%graficamos los tiempos de determinantes con x rojas
plot(X,Z,'r*')
legend('tiempos rangos', 'tiempos determinantes');
grid on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ejercicio 5. Representación gráfica en 3D
%Realice un script en Matlab que dibuje sobre el area -5 <= x, y <= 5 la superficie, la superficie en forma
%de malla y el contorno de la función:

%z = Y .* sin(0.1 * X) + 5 * cos((X.^2 + Y.^2) / 8) + cos(X + Y) .* cos(3 * X - Y);

% • En la misma figura dibuje en la parte superior y centrada la gráfica de la superficie, en la parte
%inferior izquierda la gráfica de la superficie en forma de malla y en la parte inferior derecha la
%gráfica del contorno. Además, añada la barra de color al contorno.
%• Deben añadirse etiquetas a los ejes, y un título a cada gráfic

% Definimos el rango solictidado y 100 valores en x e y
x = linspace(-5, 5, 100);
y = linspace(-5, 5, 100);

% Creamos un dominio para las coordenadas(x, y)
[X, Y] = meshgrid(x, y);

% Definimos la función z a mostrar
Z = Y .* sin(0.1 * X) + 5 * cos((X.^2 + Y.^2) / 8) + cos(X + Y) .* cos(3 * X - Y);

% Ajustar el tamaño de la figura
%set(gcf, 'Position', [100, 100, 1000, 800]);

% Crear una figura
figure;

% Añadir un título general a la figura
sgtitle('Superficie, Superficie en Forma de Malla y Contorno de la Función');

% Subplot 1: Superficie grande centrada arriba
subplot(2, 1, 1);
surf(X, Y, Z);
title('Superficie');
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');

% Subplot 2: Superficie pequeña izquierda abajo
subplot(2, 2, 3);
mesh(X, Y, Z);
title('Superficie en Forma de Malla');

% Subplot 3: Superficie pequeña derecha abajo
subplot(2, 2, 4);
contourf(X, Y, Z,20); % 20 niveles de contorno
colorbar('Location', 'eastoutside'); % Añade la barra de colores
title('Contorno');

% Etiquetas de ejes y título general
for i = 3:4
    subplot(2, 2, i);
    xlabel('Eje X');
    ylabel('Eje Y');
    zlabel('Eje Z');
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ejercicio 6. Sistemas lineales
%Dados los siguientes sistemas lineales de 10 ecuaciones con 4 incógnitas (x1, x2, x3, x4)
%1. Exprese el sistema de forma matricial en Matlab. Para ello, cree las matrices A y b.

% Definir la matriz de coeficientes A
A = [0 2 10  7;
     2 7 7 1;
     1 9 0 5;
     4 0 0 6;
     2 8 4 1;
     10 5 0 3;
     2 6 4 0;
     1 1 9 3;
     6 4 8 2;
     0 3 0 9];

% Definir el vector de términos independientes b
b = [90; 59; 15; 10; 80; 17; 93; 51; 41; 76];

% Definir la matriz de coeficientes A_2
A_2 = [0.110 0 1 0;
     0 3.260 0 1;
     0.425 0 1 0;
     0 3.754 0 1;
     0.739 0 1 0;
     0 3.888 0 1;
     1.054 0 1 0;
     0 4.202 0 1;
     1.368 0 1 0;
     0 4.516 0 1];

% Definir el vector de términos independientes b_2
b_2 = [317; 237; 319; 239; 321; 241; 323; 243; 325; 245];

%2. Escriba un script en que permita:
%a) Obtener el número de condición de la matriz A respecto a la inversión

% Paso 1: Obtener el número de condición de la matriz A
condicion_A = cond(A);

% Paso 2: Resolver el sistema de ecuaciones Ax = b utilizando linsolve
x = linsolve(A, b);
x_1 = linsolve(A_2, b_2);
% Paso 3: Añadir ruido a la matriz b
b_ruidoso = b + randn(size(b));
b_2_ruidoso = b_2 + randn(size(b));

% Paso 4: Resolver el sistema de ecuaciones con la matriz b ruidosa usando linsolve
x_ruidoso = linsolve(A, b_ruidoso);
x_ruidoso_2 = linsolve(A_2, b_2_ruidoso);
% Paso 5: Calcular la pseudo-inversa de la matriz A utilizando pinv
pseudo_inversa_A = pinv(A);

% Paso 6: Resolver el sistema de ecuaciones utilizando la pseudo-inversa de A
x_pseudo = pseudo_inversa_A * b;

% Paso 7: Resolver el sistema de ecuaciones con la matriz b ruidosa utilizando la pseudo-inversa de A
x_pseudo_ruidoso = pseudo_inversa_A * b_ruidoso;

% Paso 8: Mostrar los resultados
disp('Número de condición de A:')
disp(condicion_A);

disp('Solución sin ruido (x) utilizando linsolve:');
disp(x);

disp('Solución sin ruido (x_2) utilizando linsolve:');
disp(x_1);

disp('Solución con ruido (x_ruidoso) utilizando linsolve:');
disp(x_ruidoso);

disp('Solución sin ruido (x) utilizando la pseudo-inversa de A:');
disp(x_pseudo);

disp('Solución con ruido (x_pseudo_ruidoso) utilizando la pseudo-inversa de A:');
disp(x_pseudo_ruidoso);

%b) Resolver el sistema de ecuaciones para obtener la matriz x = [x1, x2, x3, x4]%.
%c) Añadir ruido a la matriz b, sumándole un vector aleatorio de media 0 y desviación 1, y resuelva
%el sistema de ecuaciones resultante.
%d) Mostrar el resultado (con y sin ruido añadido) por pantalla.
%Compare los resultados obtenidos en cada caso.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%FUNCIONES
%Ejercicio 3_1
function Matriz = PideDimension()

filas = input("Indique el numero de filas: ")
columnas = input("Indique el numero de columnas: ")

    if size(filas,1) > 0 && size(columnas,1) > 0 
            Matriz = zeros(filas,columnas)       
        elseif size(filas,1) > 0  && size(columnas,1) == 0 
            Matriz = zeros(filas,filas)
            columnas = filas;
        elseif size(columnas,1) > 0 && size(filas,1) == 0 
            Matriz = zeros(columnas,columnas)
            filas = columnas;
        else
             disp("Debe introducir al menos una dimension")
             PideDimension()
    end
end

%Ejercicio 3 _ 2
function matriz = IntroducirMatriz(Dimensiones)
    filas=Dimensiones(1,1)
    columnas=Dimensiones(1,2)

               matriz = rand(filas,columnas)

end


%Ejercicio 3_3
function matriz = PideMatriz(dim)
    filas=dim(1,1);
    columnas=dim(1,2);
        for i = 1:filas
          for j = 1:columnas
              valor = input("Introduzca un valor: ","s");
              if strcmp(valor,'r')
                matriz = IntroducirMatriz(dim);
              return
              else
                  valorN = str2double(valor)
                  matriz(i,j) = valorN;
              end
        end

        end
end

%Ejercicio 3_4
function matrizI = invertida(matriz)

[filas, columnas] = size(matriz);

if filas==columnas

    matrizI = inv(matriz);

else

    disp("Las matriz no tiene Inversa porque no es cuadrada")
    matrizI = matriz;
end

end

function detM = deterMatriz(matriz)

[filas, columnas] = size(matriz);

if filas==columnas

    detM = det(matriz);

else
    disp("La matriz no tiene determinante porque no es cuadrada")
    detM = 0;
end
end

%Ejercicio 4_1
function tiempo = detTiempo(matriz)
tic
    matriz
    det(matriz)
tiempo = toc
end

function tiempo = rangoTiempo(matriz)
tic
    rank(matriz)
tiempo = toc
end