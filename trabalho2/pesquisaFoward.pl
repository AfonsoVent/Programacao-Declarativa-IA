p :-
    retractall(nos(_)),
    assertz(nos(0)),
    estado_inicial(E0),
    back(E0, Sol),
    esc(Sol),
    nos(N),
    format('Nós visitados: ~w~n', [N]).

inc :-
    nos(N),
    N1 is N + 1,
    N2 is N1 mod 6240,
    retractall(nos(_)),
    assertz(nos(N2)).

% Caso base: sem variáveis pendentes, solução completa
back(e([], A), A).

% Passo recursivo: escolhe uma variável, tenta um valor do domínio
back(e([v(Pos, Dom, _)|R], Inst), Sol) :-
    member(V, Dom),
    inc,
    % Cria novo estado com valor atribuído
    EstadoNovo = e(R, [v(Pos, Dom, V) | Inst]),
    ve_restricoes(EstadoNovo),   % verifica restrições primeiro!
    back(EstadoNovo, Sol).

% Imprime solução
esc([]).
esc([v(c(Pos), _, V)|T]) :-
    write('c('), write(Pos), write('): '), write(V), nl,
    esc(T).

% Define grupos: listas de células de cada linha e coluna que usas
grupo(linha2, [(2,4), (2,5)]).
grupo(linha3, [(3,2), (3,3), (3,4), (3,5)]).
grupo(linha4, [(4,2), (4,3), (4,4)]).
grupo(linha5, [(5,2), (5,3)]).

grupo(coluna2, [(2,4), (3,2), (4,2), (5,2)]).
grupo(coluna3, [(2,5), (3,3), (4,3), (5,3)]).
grupo(coluna4, [(3,4), (4,4)]).
grupo(coluna5, [(3,5)]).

mesmo_grupo(c(X1,Y1), c(X2,Y2)) :-
    grupo(_, Celulas),
    member((X1,Y1), Celulas),
    member((X2,Y2), Celulas),
    (X1, Y1) \= (X2, Y2).