:- dynamic(nos_expandidos/1).

reset_nos_expandidos :-
    retractall(nos_expandidos(_)),
    assertz(nos_expandidos(0)).

incrementa_nos_expandidos :-
    ( retract(nos_expandidos(N)) ->
        N1 is N + 1
    ;   N1 = 1
    ),
    assertz(nos_expandidos(N1)).

alfa_beta(Pos, _, _, _, Valor, Profundidade) :-
    terminal(Pos),
    valor(Pos, Valor, Profundidade), !.

alfa_beta(Pos, max, Alfa, Beta, Valor, Profundidade) :-
    incrementa_nos_expandidos,
    findall(Mov, jogada(Pos, Mov), Movs),
    avalia_max(Movs, Pos, Alfa, Beta, -10000, Valor, Profundidade).

alfa_beta(Pos, min, Alfa, Beta, Valor, Profundidade) :-
    incrementa_nos_expandidos,
    findall(Mov, jogada(Pos, Mov), Movs),
    avalia_min(Movs, Pos, Alfa, Beta, 10000, Valor, Profundidade).

jogada(e(L, _, _, _), (Peca, Pos)) :-
    between(1, 9, Pos),
    nth1(Pos, L, v),
    member(Peca, [s, o]).

aplica(Estado, Jogada, NovoEstado) :-
    op1(Estado, Jogada, NovoEstado).

avalia_max([], _, _, _, Valor, Valor, _).
avalia_max([Mov|Movs], Pos, Alfa, Beta, V0, Valor, Prof) :-
    aplica(Pos, Mov, NovoPos),
    P1 is Prof + 1,
    alfa_beta(NovoPos, min, Alfa, Beta, V1, P1),
    V2 is max(V0, V1),
    ( V2 >= Beta ->
        Valor = V2
    ; NewAlfa is max(Alfa, V2),
      avalia_max(Movs, Pos, NewAlfa, Beta, V2, Valor, Prof)
    ).

avalia_min([], _, _, _, Valor, Valor, _).
avalia_min([Mov|Movs], Pos, Alfa, Beta, V0, Valor, Prof) :-
    aplica(Pos, Mov, NovoPos),
    P1 is Prof + 1,
    alfa_beta(NovoPos, max, Alfa, Beta, V1, P1),
    V2 is min(V0, V1),
    ( V2 =< Alfa ->
        Valor = V2
    ; NewBeta is min(Beta, V2),
      avalia_min(Movs, Pos, Alfa, NewBeta, V2, Valor, Prof)
    ).

testar(Jogo) :-
    [Jogo],
    estado_inicial(Ei),
    reset_nos_expandidos,
    alfa_beta(Ei, max, -10000, 10000, Valor, 0),
    nos_expandidos(N),
    format('Valor: ~w~n', [Valor]),
    format('Nós expandidos: ~w~n', [N]).
