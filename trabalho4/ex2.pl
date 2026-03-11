% Passo 1 - Move mão
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(1)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(2)]).

% Passo 2 - Move mão
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(2)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(3)]).

% Passo 3 - Move mão
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(3)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(6)]).

% Passo 4 - Apanha valor
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(6)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(5), posMao(6)]).

% Passo 5 - Move mão
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(5), posMao(6)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(5), posMao(5)]).

% Passo 6 - Larga valor
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(5), posMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(5)]).

% Passo 8 - Move mão
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(6)]).

% Passo 9 - Move mão
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(9)]).

% Passo 10 - Apanha valor
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), naMao(v), posMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(8), posMao(9)]).

% Passo 11 - Move mão
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(8), posMao(9)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(8), posMao(6)]).

% Passo 12 - Move mão
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(8), posMao(6)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(8), posMao(5)]).

% Passo 13 - Larga valor
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(8), posMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(8, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(v), posMao(6)]).

estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(8), posMao(9)]).
estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(8, 6), valor(6, 7), valor(7, 8), valor(v, 9), naMao(v), posMao(6)]).

accao(agarrar(Val),
    [valor(Val, Pos), naMao(v), posMao(Pos)],
    [naMao(Val), valor(b, Pos)],
    [naMao(v), valor(Val, Pos)]) :-
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]),
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]).

accao(largar(Val),
    [valor(b, Pos), naMao(Val), posMao(Pos)],
    [naMao(v), valor(Val, Pos)],
    [naMao(Val), valor(b, Pos)]) :-
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]),
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
