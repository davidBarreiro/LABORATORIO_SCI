function [Matriz] = IntroducirMatriz(numfil, numcol)
    Matriz = rand(numfil, numcol);
    for i = 1:numfil
        for j = 1:numcol
            valor = input(strcat('Valor (', num2str(i), ',', ...
                num2str(j), '): '), 's');
            if num2str(valor) ~= 'r'
                Matriz(i, j) = str2double(valor);
            end
        end
    end
end

