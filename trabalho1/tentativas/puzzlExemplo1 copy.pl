% Estado inicial
% (Posição da Entrada, Posição da Saida, Posição do 'X', Posição do 'Y', Um array de Posições das Paredes, cada array é um nivel Y)
estado_inicial(((1, 1), false, false)).

% Estado final
estado_final(((2, 7), true, true)).

% Restrições
objects((2,4), (2,6)).
walls([(4,1), (1,2), (4,2), (4,3), (4,4), (3,5), (1,6), (3,6), (7,6), (4,7)]).
visited([_]).

% Operadores(Estado_act, operador, Estado_seg, Custo):
% Andar para cima
op(((X, Y), ObjA, ObjB), 'up', ((X, Y1), ObjA, ObjB), 1):- 
    Y1 is Y + 1,
    limits(X, Y1),
    \+ wall(X, Y1),
    \+ checkVisited(X, Y1),
    visited(VisitedList),
    addVisited((X, Y1), VisitedList, NewVisited),
    visited(NewVisited).

% Andar para X direita
op(((X, Y), ObjA, ObjB), 'right', ((X1, Y), ObjA, ObjB), 1):- 
    X1 is X + 1,
    limits(X1, Y),
    \+ wall(X1, Y),
    \+ checkVisited(X1, Y),
    visited(VisitedList),
    addVisited((X1, Y), VisitedList, NewVisited),
    visited(NewVisited).

% Andar para baixo
op(((X, Y), ObjA, ObjB), 'down', ((X, Y1), ObjA, ObjB), 1):- 
    Y1 is Y - 1,
    limits(X, Y1),
    \+ wall(X, Y1),
    \+ checkVisited(X, Y1),
    visited(VisitedList),
    addVisited((X, Y1), VisitedList, NewVisited),
    visited(NewVisited).

% Andar para X esquerda
op(((X, Y), ObjA, ObjB), 'left', ((X1, Y), ObjA, ObjB), 1):- 
    X1 is X - 1,
    limits(X1, Y),
    \+ wall(X1, Y),
    \+ checkVisited(X1, Y),
    visited(VisitedList),
    addVisited((X1, Y), VisitedList, NewVisited),
    visited(NewVisited).

% Apanhar Objeto A
op(((X, Y), false, ObjB), 'takeA', ((X, Y), true, ObjB), 1):- 
    takeA(X, Y).

% Apanhar Objeto B
op(((X, Y), true, false), 'takeB', ((X, Y), true, true), 1):- 
    takeB(X, Y).

% Funções Auxiliares
limits(X, Y) :- X > 0, X < 8, Y > 0, Y < 8.
wall(X, Y) :- walls(Walls), member((X, Y), Walls).

takeA(X, Y) :- objects((X, Y), _).
takeB(X, Y) :- objects(_, (X, Y)).

checkVisited(X, Y) :-
    visited(VisitedList),
    member((X, Y), VisitedList).

addVisited(Pos, Visited, [(Pos)|Visited]).

% [pni].
% pesquisa(puzzlExemplo1, largura).
% pesquisa(puzzlExemplo1, it).
% pesquisa(puzzlExemplo1, profundidade).
% pesquisa(puzzlExemplo1, profLim()).

% estado_inicial(((1, 1), false, false)), op(((1, 1), false, false), A, B, C).
