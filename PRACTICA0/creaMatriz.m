
function matriz = crea_Matriz(Dimensiones)
    filas=Dimensiones(1,1)
    columnas=Dimensiones(1,2)

        for i = 1:filas
          for j = 1:columnas
               matriz(i,j) = rand(1,1)*10;
            end
        end

     end