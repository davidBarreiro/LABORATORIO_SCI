tiempoRango = [];
tiempoDeterminante = [];

for i = 1:25
    matriz = rand(i);
    tic;
    rank(matriz);
    tiempoRango(i) = toc; 
    tic;
    det(matriz);
    tiempoDeterminante(i) = toc;
end

f = figure;
plot(1:25, tiempoRango);
hold on;
plot(1:25, tiempoDeterminante);
xlabel('Tamaño de la matriz');
ylabel('Tiempo');
legend('Rango', 'Determinante');