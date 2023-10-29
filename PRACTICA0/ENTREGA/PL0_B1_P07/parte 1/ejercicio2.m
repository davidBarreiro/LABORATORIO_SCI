% 1. Generar matriz aleatoria y cuadrada, tamaño indicado por usuario.
tamano = input("Indique el tamaño de la matriz: ");
matriz = rand(tamano);

% 2. Presentar por pantalla:
%   a) Matriz generada
matriz

%   b) Matriz formada por las columnas impares de la matriz inicial
matrizImpares = [];
for i = 1:2:tamano
    matrizImpares(:,end+1) = matriz(:,i); 
end

matrizImpares

%   c) Valor de los elementos de la diagonal de la matriz generada
disp(diag(matriz))

%   d) Valores máximo, mínimo, medio y varianza de cada fila
vectorMax = zeros();
vectorMin = zeros();
vectorMean = zeros();
vectorVar = zeros();

for i = 1:tamano
    vectorMax(i) = max(matriz(i,:));
    vectorMin(i) = min(matriz(i,:));
    vectorMean(i) = mean(matriz(i,:));
    vectorVar(i) = var(matriz(i,:));
end

f = figure;
plot(1:tamano, vectorMax, 'o-r');
hold on
plot(1:tamano, vectorMin, 'o-b');
plot(1:tamano, vectorMean, 'm-o');
plot(1:tamano, vectorVar, 'o-k');
hold off
title('Gráfica')
xlabel('Filas de la matriz')
ylabel('Valores de la matriz')



