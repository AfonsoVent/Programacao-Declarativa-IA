game(Jogo) :-
    [Jogo], 
    estado_inicial(Ei), 
    jogar(Ei), 
    nl.

jogar(E1):- 
    ia(E1, E2, Op1), 
    write(Op1), nl,
    write(E2), nl,
    % jogador(E2, E3, Op2), 
    % write(Op2, E3), 
    jogar(E2).

ia(E1, E2, Op):-
    \+ terminal(E1),
    minimax_decidir(E1, Op),
    op1(E1, Op, E2).