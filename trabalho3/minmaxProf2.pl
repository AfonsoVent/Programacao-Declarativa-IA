max_profundidade(3).

maior_ou_igual(X, Y) :- number(X), number(Y), X >= Y.

g(Jogo):- 
    [Jogo], 
    estado_inicial(Ei), 
    minimax_decidir(Ei, Op),
    write('Melhor jogada: '), write(Op), nl.

minimax_decidir(Ei, terminou) :-
    terminal(Ei), !.

minimax_decidir(Ei, Opf) :- 
    findall(Es-Op, op1(Ei, Op, Es), L),
    findall(Vc-Op, (
        member(Es-Op, L),
        minimax_valor(Es, max, 1, Vc)  
    ), L1),
    escolhe_max_op(L1, Opf).

minimax_valor(Ei, _, _, Val) :-
    terminal(Ei), 
    valor(Ei, Val, _), !.

minimax_valor(Ei, _, P, Val) :-
    max_profundidade(Max),
    maior_ou_igual(P, Max),
    avalia(Ei, Val), !.

minimax_valor(Ei, Tipo, P, Val) :-
    findall(Es, op1(Ei, _, Es), L),
    P1 is P + 1,
    oposto(Tipo, TipoFilho),
    findall(V1, (
        member(Es, L),
        minimax_valor(Es, TipoFilho, P1, V1)
    ), Vs),
    escolhe_valor(Tipo, Vs, Val).

oposto(max, min).
oposto(min, max).

escolhe_valor(max, Vs, Val) :- maximo(Vs, Val).
escolhe_valor(min, Vs, Val) :- minimo(Vs, Val).

escolhe_max_op([V-Op | R], Opf) :- escolhe_max_op(R, V-Op, Opf).

escolhe_max_op([], _V-Op, Op).
escolhe_max_op([V1-Op1 | R], V0-Op0, Opf) :-
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
