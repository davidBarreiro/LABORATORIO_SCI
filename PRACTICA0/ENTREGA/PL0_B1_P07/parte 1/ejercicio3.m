dimension = input('Introduzca la dimensión de la matriz A [filas cols]: ');

if size(dimension) == 1
    matrizA = IntroducirMatriz(dimension(1), dimension(1));
else 
    matrizA = IntroducirMatriz(dimension(1), dimension(2));
end

dimension = input('Introduzca la dimensión de la matriz B [filas cols]: '); 

if size(dimension) == 1
    matrizB = IntroducirMatriz(dimension(1), dimension(1));
else 
    matrizB = IntroducirMatriz(dimension(1), dimension(2));
end

% Imprimir matrices
disp('Matriz A')
disp(matrizA)
disp('Matriz B')
disp(matrizB)

% Traspuesta de matrices
disp('Traspuesta de la matriz A')
disp(transpose(matrizA))
disp('Traspuesta de la matriz B')
disp(matrizB.')

% Comprobar si la matriz es cuadrada para hacer inversa
if size(matrizA,1) == size(matrizA,2)
    disp('Inversa de la matriz A: ')
    disp(inv(matrizA))
else
    disp('No se puede realizar la inversa de A porque no es cuadrada')
end

if size(matrizB,1) == size(matrizB,2)
    disp('Inversa de la matriz B')
    disp(inv(matrizB))
else
    disp('No se puede realizar la inversa de B porque no es cuadrada')
end

% Producto
if size(matrizA,2) == size(matrizB,1)
    disp('Producto matricial A y B: ')
    disp(matrizA*matrizB)
else
    disp('No se puede realizar el producto matricial de A y B')
end

if size(matrizA) == size(matrizB)
    disp(matrizA.*matrizB)
else
    disp('No se puede realizar el producto elemento a elemento de A y B')
end

% Vector fila concatenando la primera fila de las matrices
disp('Vector primera fila de A y B: ')
disp([matrizA(1,:) matrizB(1,:)])

% Vector columna concatenando la primera columna de las matrices
disp('Vector primera columna de A y B: ')
disp([matrizA(:,1) ; matrizB(:,1)])
