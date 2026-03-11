game(Jogo) :-
    [Jogo], 
    estado_inicial(Ei), 
    jogar(Ei), 
    nl.

checkEnd(E1):- 
    terminal(E1),
    endGame(E1),
    !.
checkEnd(_).

endGame(E1):-
    valor(E1, Vencedor, _),
    Vencedor == 1,
    write('--- Fim do jogo ---'), nl,
    write('O Jogador venceu'), nl.
endGame(E1):-
    valor(E1, Vencedor, _),
    Vencedor == -1,
    write('--- Fim do jogo ---'), nl,
    write('A IA venceu'), nl.
endGame(E1):-
    write('--- Fim do jogo ---'), nl,
    write('Empate'), nl.

jogar(E1):- 
    jogador(E1, E2, Op1),
    write(E2), nl,
    checkEnd(E2),
    ia(E2, E3, Op2),
    write('É a vez da IA:'), nl,
    write(Op2), nl,
    write(E3), nl,
    checkEnd(E3),
    jogar(E3).

jogador(Ei, Es, Op):-
    write('É a vez do jogador:'), nl,
    read(Answer),
    checkInput(Answer, Op),
    op1(Ei, Op, Es).

ia(Ei, Es, Op):-
    minimax_decidir(Ei, Op),
    op1(Ei, Op, Es).

% ver se a peça foi colocada
checkInput(Answer, Op):-
    Answer = (Peca, Valor),
    (Peca == s; Peca == o), !,
    between(1, 9, Valor),
    Op = Answer. 
checkInput(_, Op):-
    write('Resposta Inválida, jogue da seguinte forma: (o, 1)'), nl,
    read(Answer),
    checkInput(Answer, Op).