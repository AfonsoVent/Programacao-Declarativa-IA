max_profundidade(3).

maior_ou_igual(X, Y) :- number(X), number(Y), X >= Y.

g(Jogo):- 
    [Jogo], 
    estado_inicial(Ei), 
    minimax_decidir(Ei, Op, Nos),
    write('Melhor jogada: '), write(Op), nl,
    write('Nós visitados: '), write(Nos), nl.

minimax_decidir(Ei, terminou, 1) :-
    terminal(Ei), !.

minimax_decidir(Ei, Opf, TotalNos) :- 
    findall(Es-Op, op1(Ei, Op, Es), L),
    findall(Vc-Op-Nos, (
        member(Es-Op, L),
        minimax_valor(Es, max, 1, Vc, Nos)
    ), L1),
    escolhe_max_op(L1, Opf),
    soma_nos(L1, SomaNos),
    TotalNos is SomaNos + 1.

minimax_valor(Ei, _, _, Val, 1) :-
    terminal(Ei), 
    valor(Ei, Val, _), !.

minimax_valor(Ei, _, P, Val, 1) :-
    max_profundidade(Max),
    maior_ou_igual(P, Max),
    avalia(Ei, Val), !.

minimax_valor(Ei, Tipo, P, Val, TotalNos) :-
    findall(Es, op1(Ei, _, Es), L),
    P1 is P + 1,
    oposto(Tipo, TipoFilho),
    findall(V1-Nos1, (
        member(Es, L),
        minimax_valor(Es, TipoFilho, P1, V1, Nos1)
    ), ValsNos),
    unzip_vals_nos(ValsNos, Vals, NosList),
    escolhe_valor(Tipo, Vals, Val),
    soma_nos_list(NosList, SomaNos),
    TotalNos is SomaNos + 1.

oposto(max, min).
oposto(min, max).

escolhe_valor(max, Vs, Val) :- maximo(Vs, Val).
escolhe_valor(min, Vs, Val) :- minimo(Vs, Val).

escolhe_max_op([V-Op-_|R], Opf) :- escolhe_max_op(R, V-Op, Opf).

escolhe_max_op([], _V-Op, Op).
escolhe_max_op([V1-Op1-_|R], V0-Op0, Opf) :-
    (V1 > V0 -> escolhe_max_op(R, V1-Op1, Opf)
    ; escolhe_max_op(R, V0-Op0, Opf)).

maximo([A|R], Val) :- maximo(R, A, Val).
maximo([], A, A).
maximo([A|R], X, Val) :- A > X, !, maximo(R, A, Val).
maximo([_|R], X, Val) :- maximo(R, X, Val).

minimo([A|R], Val) :- minimo(R, A, Val).
minimo([], A, A).
minimo([A|R], X, Val) :- A < X, !, minimo(R, A, Val).
minimo([_|R], X, Val) :- minimo(R, X, Val).

unzip_vals_nos([], [], []).
unzip_vals_nos([V-N|R], [V|VR], [N|NR]) :- unzip_vals_nos(R, VR, NR).

soma_nos_list([], 0).
soma_nos_list([X|R], Soma) :-
    soma_nos_list(R, SomaR),
    Soma is X + SomaR.

soma_nos([], 0).
soma_nos([_-_-N | R], Soma) :-
    soma_nos(R, SomaR),
    Soma is N + SomaR.
