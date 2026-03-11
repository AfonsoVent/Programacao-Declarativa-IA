% Inicializa o contador no início
p :- 
    retractall(nos_visitados(_)),
    assertz(nos_visitados(0)),
    estado_inicial(E0), 
    back(E0, A),
    nos_visitados(Nos),
    esc(A, Nos).

% Mostra solução + número de nós
esc(A, Nos):- 
    write(A), nl, 
    write('Nós visitados: '), write(Nos), nl.

% Caso base
back(e([], A), A).

% Caso recursivo
back(E, Sol) :- 
    incrementa_contador,
    sucessor(E, E1),
    ve_restricoes(E1),
    back(E1, Sol).

% Incrementa o contador global
incrementa_contador :-
    nos_visitados(N),
    N1 is N + 1,
    retractall(nos_visitados(_)),
    assertz(nos_visitados(N1)).

% Sucessor como já tens
sucessor(e([v(N, D, V)| R], L), e(R, [v(N, D, V)| L])) :- 
    member(V, D).
