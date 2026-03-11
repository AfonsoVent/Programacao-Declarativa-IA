% Passo 1
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(1)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(2)]).

% Passo 2
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(2)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(b)]).

% Passo 3
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(b)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(5)]).

% Passo 4
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(5)]).

% Passo 5
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(5)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(b)]).

% Passo 6
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(b)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(8)]).

% Passo 7
% estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(b, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(8)]).
% estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(5, 5), valor(8, 6), valor(6, 7), valor(7, 8), valor(b, 9), mirarMao(8)]).

estado_inicial([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(1)]).
estado_final([valor(1, 1), valor(2, 2), valor(3, 3), valor(4, 4), valor(b, 5), valor(5, 6), valor(6, 7), valor(7, 8), valor(8, 9), mirarMao(6)]).

accao(moverValC(Val), 
    [valor(Val, Pos), valor(b, NewPos)], 
    [valor(Val, NewPos), valor(b, Pos)], 
    [valor(Val, Pos), valor(b, NewPos)]) :- 
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]),
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        NewPos is Pos - 3.

accao(moverValB(Val), 
    [valor(Val, Pos), valor(b, NewPos)], 
    [valor(Val, NewPos), valor(b, Pos)], 
    [valor(Val, Pos), valor(b, NewPos)]) :- 
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]),
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        NewPos is Pos + 3.

accao(moverValE(Val), 
    [valor(Val, Pos), valor(b, NewPos)], 
    [valor(Val, NewPos), valor(b, Pos)], 
    [valor(Val, Pos), valor(b, NewPos)]) :- 
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]),
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        NewPos is Pos - 1, 
        NewPos \= 1, 
        NewPos \= 4, 
        NewPos \= 7.

accao(moverValD(Val), 
    [valor(Val, Pos), valor(b, NewPos)], 
    [valor(Val, NewPos), valor(b, Pos)], 
    [valor(Val, Pos), valor(b, NewPos)]) :- 
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]),
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        NewPos is Pos + 1, 
        NewPos \= 3, 
        NewPos \= 6, 
        NewPos \= 9.

accao(moverMaoC(Val), 
    [mirarMao(Val), valor(Val, Pos), valor(NewVal, NewPos)], 
    [mirarMao(NewVal)], 
    [mirarMao(Val)]) :- 
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        NewPos is Pos - 3,
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]), 
        member(NewVal, [1, 2, 3, 4, 5, 6, 7, 8, b]).

accao(moverMaoB(Val), 
    [mirarMao(Val), valor(Val, Pos), valor(NewVal, NewPos)], 
    [mirarMao(NewVal)], 
    [mirarMao(Val)]) :- 
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]), 
        member(NewVal, [1, 2, 3, 4, 5, 6, 7, 8, b]), 
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        NewPos is Pos + 3,
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]).

accao(moverMaoE(Val), 
    [mirarMao(Val), valor(Val, Pos), valor(NewVal, NewPos)], 
    [mirarMao(NewVal)], 
    [mirarMao(Val)]) :- 
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]), 
        member(NewVal, [1, 2, 3, 4, 5, 6, 7, 8, b]), 
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        NewPos is Pos - 1,
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        Pos \= 1, 
        Pos \= 4, 
        Pos \= 7.

accao(moverMaoD(Val), 
    [mirarMao(Val), valor(Val, Pos), valor(NewVal, NewPos)], 
    [mirarMao(NewVal)], 
    [mirarMao(Val)]) :- 
        member(Val, [1, 2, 3, 4, 5, 6, 7, 8, b]), 
        member(NewVal, [1, 2, 3, 4, 5, 6, 7, 8, b]), 
        member(Pos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        NewPos is Pos + 1,
        member(NewPos, [1, 2, 3, 4, 5, 6, 7, 8, 9]), 
        Pos \= 3, 
        Pos \= 6, 
        Pos \= 9.

