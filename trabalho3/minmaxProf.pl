max_profundidade(3).

maior_ou_igual(X, Y) :- number(X), number(Y), X >= Y.

g(Jogo):- 
    [Jogo], 
    estado_inicial(Ei), 
    minimax_decidir(Ei, Op, NumNos),
    write('Melhor jogada: '), write(Op), nl,
    write('Nós visitados: '), write(NumNos), nl.

minimax_decidir(Ei, terminou, 1):- 
    terminal(Ei).

minimax_decidir(Ei, Opf, TotalNos):- 
    findall(Es-Op, op1(Ei,Op,Es), L),
    findall(Vc-Op-Nos, (
        member(E-Op, L),
        minimax_valor(E, Vc, 1, Nos)
    ), L1),
    escolhe_max_nos(L1, Opf),
    soma_nos(L1, TotalNos1),
    TotalNos is TotalNos1 + 1. 

minimax_valor(Ei, Val, _P, 1):- 
    terminal(Ei), 
    valor(Ei, Val, _P), !.

minimax_valor(Ei, Val, P, 1):- 
    max_profundidade(Max),
    maior_ou_igual(P, Max),
    avalia(Ei, Val), !.

minimax_valor(Ei, Val, P, TotalNos):- 
    max_profundidade(Max),
    P < Max,
    findall(Es, op1(Ei, _, Es), L),
    P1 is P + 1,
    findall(Val1-Nos1, (
        member(E, L),
        minimax_valor(E, Val1, P1, Nos1)
    ), ValsNos),
    unzip_vals_nos(ValsNos, Vals, NosList),
    seleciona_valor(Vals, P, Val),
    soma_nos_list(NosList, SomaNos),
    TotalNos is SomaNos + 1.

unzip_vals_nos([], [], []).
unzip_vals_nos([V-N | R], [V | Vr], [N | Nr]):-
    unzip_vals_nos(R, Vr, Nr).

soma_nos_list([], 0).
soma_nos_list([X | R], Soma):-
    soma_nos_list(R, SomaR),
    Soma is X + SomaR.

soma_nos([], 0).
soma_nos([_V-_Op-N | R], Soma):-
    soma_nos(R, SomaR),
    Soma is N + SomaR.

seleciona_valor(V, P, Val):- 
    X is P mod 2, 
    X = 0, !, 
    maximo(V, Val).

seleciona_valor(V, _, Val):- 
    minimo(V, Val).

escolhe_max_nos([A | R], Val):- escolhe_max_nos(R, A, Val).

escolhe_max_nos([], _V-Op-_Nos, Op).
escolhe_max_nos([V-_-_ | R], X-OpX-_, Val):- V < X, !, escolhe_max_nos(R, X-OpX-_, Val).
escolhe_max_nos([A | R], _, Val):- escolhe_max_nos(R, A, Val).

maximo([A|R],Val):- maximo(R,A,Val).
maximo([],A,A).
maximo([A|R],X,Val):- A < X,!, maximo(R,X,Val).
maximo([A|R],_,Val):- maximo(R,A,Val).

minimo([A|R],Val):- minimo(R,A,Val).
minimo([],A,A).
minimo([A|R],X,Val):- A > X,!, minimo(R,X,Val).
minimo([A|R],_,Val):- minimo(R,A,Val).
