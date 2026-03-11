% Passo 1 - Move Direita
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(1)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(2)]).

% Passo 2 - Move Direita
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(2)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(3)]).

% Passo 3 - Move Baixo
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(3)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(6)]).

% Passo 4 - Agarrar
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(6)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(5), posMao(6)]).

% Passo 5 - Move Esquerda
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(5), posMao(6)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(5), posMao(5)]).

% Passo 6 - Largar
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(5), posMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(5)]).

% Passo 7 - Move Direita
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(6)]).

% Passo 8 - Move Baixo
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(6)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(9)]).

% Passo 9 - Agarrar
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(9)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(b, 9), naMao(8), posMao(9)]).

% Passo 10 - Move Cima
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(b, 9), naMao(8), posMao(9)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(b, 9), naMao(8), posMao(6)]).

% Passo 11 - Largar
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(b, 9), naMao(8), posMao(6)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(8, 6), valor(6, 7), valor(7, 8), valor(b, 9), maoLivre, posMao(6)]).

% Passo 12 - Move Baixo
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(8, 6), valor(6, 7), valor(7, 8), valor(b, 9), maoLivre, posMao(6)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(8, 6), valor(6, 7), valor(7, 8), valor(b, 9), maoLivre, posMao(9)]).

estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), maoLivre, posMao(1)]).
estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(8, 6), valor(6, 7), valor(7, 8), valor(b, 9), maoLivre, posMao(9)]).

accao(agarrar(Valor),
    [valor(Valor, Pos), maoLivre, posMao(Pos)],
    [naMao(Valor), valor(b, Pos)],
    [maoLivre, valor(Valor, Pos)]) :-
        member(Valor, [1, 2, 3, 4, 5, 6, 7, 8, b]),
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]).

accao(largar(Valor),
    [valor(b, Pos), naMao(Valor), posMao(Pos)],
    [maoLivre, valor(Valor, Pos)],
    [naMao(Valor), valor(b, Pos)]) :-
        member(Valor, [1, 2, 3, 4, 5, 6, 7, 8, b]),
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]).  

accao(cima(Pos),
    [posMao(Pos)],
    [posMao(NewPos)],
    [posMao(Pos)]) :-
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
        NewPos is Pos - 3,
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]).
        

accao(baixo(Pos),
    [posMao(Pos)],
    [posMao(NewPos)],
    [posMao(Pos)]) :-
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
        NewPos is Pos + 3,
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]).

accao(direita(Pos),
    [posMao(Pos)],
    [posMao(NewPos)],
    [posMao(Pos)]) :-
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
        Pos \= 3,
        Pos \= 6,
        Pos \= 9,
        NewPos is Pos + 1,
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]).

accao(esquerda(Pos),
    [posMao(Pos)],
    [posMao(NewPos)],
    [posMao(Pos)]) :-
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
        Pos \= 1,
        Pos \= 4,
        Pos \= 7,
        NewPos is Pos - 1,
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]).
