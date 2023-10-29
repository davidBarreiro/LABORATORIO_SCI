% Matrices
A = [0 2 10 7 ; 2 7 7 1 ; 1 9 0 5 ; 4 0 0 6 ; 2 8 4 1 ; 10 5 0 3 ;
     2 6 4 0 ; 1 1 9 3 ; 6 4 8 2 ; 0 3 0 9];
Asol = [90 ; 59 ; 15 ; 10 ; 80 ; 17 ; 93 ; 51 ; 41 ; 76];
B = [0.110 0 1 0 ; 0 3.260 0 1 ; 0.425 0 1 0 ; 0 3.574 0 1 ; 0.739 0 1 0 ;
     0 3.888 0 1 ; 1.054 0 1 0 ; 0 4.202 0 1 ; 1.368 0 1 0 ; 0 4.516 0 1];
Bsol = [317 ; 237 ; 319 ; 239 ; 312 ; 241 ; 323 ; 243 ; 325 ; 245];

% Número de condición de las matrices
disp('Número de condición matriz A: ');
disp(cond(A));
disp('Número de condición matriz B: ');
disp(cond(B));

% Resultado del sistema A
disp('Resultado del sistema de ecuaciones A: ');
solA = linsolve(A, Asol);
disp(solA);

% Ruido
ruido = rand(10,1);
disp('Resultado del sistema de ecuaciones b sin ruido: ');
solB = linsolve(B, Bsol);
disp(solB);
disp('Resultado del sistema de ecuaciones b con ruido: ');
solBruido = linsolve(B, Bsol + ruido);
disp(solBruido);


