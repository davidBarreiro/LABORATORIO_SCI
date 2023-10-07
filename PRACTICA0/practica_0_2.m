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
%}

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
%Realice un script en Matlab que dibuje sobre el área −5 ≤ 𝑥, 𝑦 ≤ 5 la superficie, la superficie en forma
%de malla y el contorno de la función:
%{
𝑧 = 𝑦 ∗ 𝑠𝑖𝑛 :𝑝𝑖 ∗
𝑥
10
< + 5 ∗ cos ((𝑥B + 𝑦B)/8) + 𝑐𝑜𝑠(𝑥 + 𝑦)𝑐𝑜𝑠(3𝑥 − 𝑦).
%}

% • En la misma figura dibuje en la parte superior y centrada la gráfica de la superficie, en la parte
%inferior izquierda la gráfica de la superficie en forma de malla y en la parte inferior derecha la
%gráfica del contorno. Además, añada la barra de color al contorno.
%• Deben añadirse etiquetas a los ejes, y un título a cada gráfica

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
%INTRODUCCION A MATLAB II

%Ejercicio 1. Transformadas de señales.
%1. Obtenga la transformada z de la siguiente función: 𝑓(𝑘) = 2 + 5𝑘 + 𝑘!. Represente gráficamente las
%señales original y transformada.

clear all

figure
muestras = 10;
x= 1:1:muestras
y= 2 + 5*(x) + (x*x)
%for k = 1:muestras
%        Y(1,k)= 2 + 5*k + k^2;
%        X(1,k)= k;
%end 

%graficamos los maximos con x azules
plot(x,y,'b--')
title('Grafica funcion f(k)')
xlabel('k')
ylabel('valores')

%transformada z
%syms k
%f = 2 + 5*k + k^2;
%funZ = ztrans(f)

%for k = 1:muestras
 %       Z(1,k)= funZ;
%T= 1:0.01:muestras

%end 

%hold on;
%graficamos las transformada z con circulos verdes
%plot(T,funZ,'g--')


%2. Obtenga la transformada z de la siguiente función: 𝑓(𝑘) = sen(𝑘) ∙ 𝑒"#$. Represente gráficamente,
%de nuevo, la señales original y transformada.
%3. Dada la siguiente función de transferencia discreta:

%• Obtenga y represente la respuesta al impulso del sistema.
%• Obtenga y represente la respuesta del sistema ante una entrada escalón.
%Algunas funciones útiles: ztrans, step, impulse, tf (para la resolución de este ejercicio es necesario tener instalada las
%Toolboxes "Symbolic Math Toolbox” y “Control System Toolbox”).

