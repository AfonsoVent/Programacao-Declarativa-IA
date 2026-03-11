% Estado inicial
% (Posicao da Entrada(Posicao do 'X', Posicao do 'Y'), boolean de objA, boolean de objb, caminhos realizados(Com posicoes andadas com contexto boolean dos objA e objB)).
estado_inicial(((1, 1), false, false, [])).

% Estado final
estado_final(((5, 7), true, true, _)).

% Restrições
objects((3,7), (3,4)).
walls([(4,2), (4,3), (1,6), (3,6), (7,6)]).

% Operadores(Estado_act, operador, Estado_seg, Custo):
% Apanhar Objeto A
op(((X, Y), false, false, Visited), 'takeA', ((X, Y), true, false, Visited), 1):- 
    takeA(X, Y).

% Apanhar Objeto B
op(((X, Y), true, false, Visited), 'takeB', ((X, Y), true, true, Visited), 1):- 
    takeB(X, Y).

% Andar para cima
op(((X, Y), ObjA, ObjB, Visited), 'up', ((X, Y1), ObjA, ObjB, NewVisited), 1):- 
    Y1 is Y + 1,
    limits(X, Y1),
    \+ wall(X, Y1),
    \+ checkVisited(ObjA, ObjB, X, Y1, Visited),
    updateVisited(ObjA, ObjB, X, Y1, Visited, NewVisited).

% Andar para X direita
op(((X, Y), ObjA, ObjB, Visited), 'right', ((X1, Y), ObjA, ObjB, NewVisited), 1):- 
    X1 is X + 1,
    limits(X1, Y),
    \+ wall(X1, Y),
    \+ checkVisited(ObjA, ObjB, X1, Y, Visited),
    updateVisited(ObjA, ObjB, X1, Y, Visited, NewVisited).

% Andar para baixo
op(((X, Y), ObjA, ObjB, Visited), 'down', ((X, Y1), ObjA, ObjB, NewVisited), 1):- 
    Y1 is Y - 1,
    limits(X, Y1),
    \+ wall(X, Y1),
    \+ checkVisited(ObjA, ObjB, X, Y1, Visited),
    updateVisited(ObjA, ObjB, X, Y1, Visited, NewVisited).

% Andar para X esquerda
op(((X, Y), ObjA, ObjB, Visited), 'left', ((X1, Y), ObjA, ObjB, NewVisited), 1):- 
    X1 is X - 1,
    limits(X1, Y),
    \+ wall(X1, Y),
    \+ checkVisited(ObjA, ObjB, X1, Y, Visited),
    updateVisited(ObjA, ObjB, X1, Y, Visited, NewVisited).

% Funções Auxiliares
limits(X, Y) :- X > 0, X < 8, Y > 0, Y < 8.
wall(X, Y) :- walls(Walls), member((X, Y), Walls).

takeA(X, Y) :- objects((X, Y), _).
takeB(X, Y) :- objects(_, (X, Y)).

checkVisited(ObjA, ObjB, X, Y, VisitedList) :-
    member((ObjA, ObjB, X, Y), VisitedList).

updateVisited(ObjA, ObjB, X, Y, [], [[ObjA, ObjB, X, Y]]).
updateVisited(ObjA, ObjB, X, Y, [Visited | Tail], [Visited | NewVisited]) :-
    updateVisited(ObjA, ObjB, X, Y, Tail, NewVisited).