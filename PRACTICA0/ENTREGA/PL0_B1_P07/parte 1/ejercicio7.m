p1 = "Introduce el polinomio con [ ] entre los números. Ej: [X Y Z]\n ";
pol1 = input(p1);

p2 = "Introduce el polinomio con [ ] entre los números. Ej: [X Y Z]\n ";
pol2 = input(p2);

raices(pol1,pol2)

function [solucion, real, nreal] = raices (pol1, pol2)
    nreal =0;
    real =0;
    polinomio = "¿Sobre que polonomio desea obtener las raíces? 1= polinomio 1; 2 = polinomio 2; 3 = producto de los polinomios: ";
    polinomioE = input(polinomio);
    if polinomioE == 1
        sols1 = roots(pol1);
        for i = 1:(length(sols1))
            if isreal(sols1(i))
                real = real + 1;
            else
                nreal = nreal + 1;
            end
        end
        plot(sols1,'bo')
        roots(pol1)
    elseif polinomioE == 2
        sols2 = roots(pol2);
        for i = 1:(length(sols2))
            if isreal(sols2(i))
                real = real + 1;
            else
                nreal = nreal + 1;
            end
        end
        plot(sols2,'bo')
        roots(pol2)
    else 
        pol = conv(pol1,pol2);
        sols = roots(pol);
        for i = 1:(length(sols))
            if isreal(sols(i))
                real = real + 1;
            else
                nreal = nreal + 1;
            end
        end
        plot(sols,'bo')
        roots(pol)
    end   
    solucion = [real nreal];
end
