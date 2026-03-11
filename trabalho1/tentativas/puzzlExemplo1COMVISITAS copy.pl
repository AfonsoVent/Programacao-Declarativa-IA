% Estado inicial
% (Posição da Entrada, Posição da Saida, Posição do 'X', Posição do 'Y', Um array de Posições das Paredes, cada array é um nivel Y)
estado_inicial(((1, 1), false, false)).

% Estado final
estado_final(((2, 7), true, true)).

% Restrições
objects((2,4), (2,6)).
walls([(4,1), (1,2), (4,2), (4,3), (4,4), (3,5), (1,6), (3,6), (7,6), (4,7)]).
:- dynamic visited/1.
visited([]).

% Operadores(Estado_act, operador, Estado_seg, Custo):
% Andar para cima
op(((X, Y), _, _), 'up', ((X, Y1), _, _), 1):- 
    Y1 is Y + 1,
    limits(X, Y1),
    \+ wall(X, Y1),
    \+ has_visited(X, Y1),
    asserta_visited(X, Y1).

% Andar para X esquerda
op(((X, Y), _, _), 'left', ((X1, Y), _, _), 1):- 
    X1 is X - 1
    limits(X1, Y),
    \+ wall(X1, Y),
    \+ has_visited(X1, Y),
    asserta_visited(X1, Y).

% Andar para baixo
op(((X, Y), _, _), 'down', ((X, Y1), _, _), 1):- 
    Y1 is Y - 1,
    limits(X, Y1),
    \+ wall(X, Y1),
    \+ has_visited(X, Y1),
    asserta_visited(X, Y1).

% Andar para X direita
op(((X, Y), _, _), 'right', ((X1, Y), _, _), 1):- 
    X1 is X + 1,
    limits(X1, Y),
    \+ wall(X1, Y),
    \+ has_visited(X1, Y),
    asserta_visited(X1, Y).

% Apanhar Objeto A
op(((X, Y), false, _), 'takeA', ((X, Y), true, _), 1):- 
    takeA(X, Y).

% Apanhar Objeto B
op(((X, Y), true, false), 'takeB', ((X, Y), true, true), 1):- 
    takeB(X, Y).

% Funções Auxiliares
limits(X, Y) :- X > 0, X < 8, Y > 0, Y < 8.
wall(X, Y) :- walls(Walls), member((X, Y), Walls).

takeA(X, Y) :- objects((X, Y), _).
takeB(X, Y) :- objects(_, (X, Y)).

% Verifica se uma posição foi visitada
has_visited(X, Y) :-
    visited(VisitedList),
    member((X, Y), VisitedList).

% Marca uma posição como visitada
asserta_visited(X, Y) :-
    visited(VisitedList),
    \+ member((X, Y), VisitedList), % Só adiciona se não estiver já na lista
    retract(visited(VisitedList)),
    asserta(visited([(X, Y) | VisitedList])).