p :- 
    retractall(nos(_)), 
    assertz(nos(0)), 
    estado_inicial(E0), 
    back(E0, Solucao), 
    esc(Solucao),
    nos(N), format('Nós visitados: ~w~n', [N]).

%Contador de nós
inc :- nos(N), N1 is N + 1, N2 is N1 mod 16280, retractall(nos(_)), assertz(nos(N2)).

%Algoritmo principal
back(e([], A), A).
back(E, Sol) :-
    sucessor(E, E1),
    inc,
    ve_restricoes(E1),    % <-- aqui usas o teu predicado de restrições
    forCheck(E1, E2),
    \+ dominio_vazio(E2),
    back(E2, Sol).


%Sucessores com heurística MRV (variável com menor domínio)
sucessor(e(Vars, E), e(Restantes, [v(N,D,V)|E])) :- escolhe_menor_dom(Vars, v(N,D,_), Restantes), member(V, D).

%Forward Checking
forCheck(e(LNao, [v(N,_,V)|E]), e(LNaoFiltrado, [v(N,_,V)|E])) :- corta_condicional(N, V, LNao, LNaoFiltrado).

corta_condicional(_, _, [], []). 
corta_condicional(N, V, [v(N2,D,Val)|R], [v(N2,DNew,Val)|RR]) :- (mesmo_grupo(N, N2) -> delete(D, V, DNew) ; DNew = D), corta_condicional(N, V, R, RR).

mesmo_grupo(N1, N2) :- grupo(Cels, _), member(N1, Cels), member(N2, Cels), N1 \= N2.

%Verifica domínios vazios
dominio_vazio(e(Vars, _)) :- member(v(_, [], _), Vars).

esc([]).
esc([v(c(N),_,V)|T]) :-write('c('), write(N), write('): '), write(V), nl, esc(T).

%Heurística MRV: escolhe a variável com o menor domínio
escolhe_menor_dom([V], V, []).
escolhe_menor_dom([v(N1,D1,V1), v(N2,D2,V2)|R], Menor, [Maior|Rest]) :- length(D1, L1), length(D2, L2),
    (L1 =< L2 ->
        MenorTemp = v(N1,D1,V1),
        Maior = v(N2,D2,V2)
    ;
        MenorTemp = v(N2,D2,V2),
        Maior = v(N1,D1,V1)
    ),
    escolhe_menor_dom([MenorTemp | R], Menor, Rest).

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
