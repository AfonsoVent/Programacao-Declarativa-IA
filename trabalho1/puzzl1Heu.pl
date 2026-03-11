% Estado inicial
% (Posicao da Entrada(Posicao do 'X', Posicao do 'Y'), boolean de objA, boolean de objb, caminhos realizados(Com posicoes andadas com contexto boolean dos objA e objB)).
estado_inicial(((1, 1), false, false, [])).

% Estado final
estado_final(((2, 7), true, true, _)).

% Restrições
objects((2,4), (2,6)).
walls([(4,1), (1,2), (4,2), (4,3), (4,4), (3,5), (1,6), (3,6), (7,6), (4,7)]).

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

% Selecionar a Heuristica
h(A,B):- h2(A,B).

h1(E, Val) :-
    estado_final(Ef),
    heuristica1(E, Ef, Val).

h2(E, Val) :-
    estado_final(Ef),
    heuristica2(E, Ef, Val).

% Heuristica1:
% Distancia da Posição atual com a Saida.
heuristica1(((X, Y), _, _, _), ((XS, YS), _, _, _), H) :-
    modDif(X, XS, Result1),
    modDif(Y, YS, Result2),
    H is Result1 + Result2.

% Heuristica2:
% Distancia da Posição atual com a Saida, considerando se os objetos foram obtidos e suas as distancias.
heuristica2(((X, Y), false, _, _), ((XS, YS), _, _, _), H) :-
    objects((ObjAX, ObjAY), (ObjBX, ObjBY)),
    modDif(X, ObjAX, Result1),
    modDif(Y, ObjAY, Result2),
    modDif(ObjAX, ObjBX, Result3),
    modDif(ObjAY, ObjBY, Result4),
    modDif(ObjBX, XS, Result5),
    modDif(ObjBY, YS, Result6),
    H is Result1 + Result2 + Result3 + Result4 + Result5 + Result6.
heuristica2(((X, Y), true, false, _), ((XS, YS), _, _, _), H) :-
    objects(_, (ObjBX, ObjBY)),
    modDif(X, ObjBX, Result1),
    modDif(Y, ObjBY, Result2),
    modDif(ObjBX, XS, Result3),
    modDif(ObjBY, YS, Result4),
    H is Result1 + Result2 + Result3 + Result4.
heuristica2(((X, Y), true, true, _), ((XS, YS), _, _, _), H) :-
    modDif(X, XS, Result1),
    modDif(Y, YS, Result2),
    H is Result1 + Result2.

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

modDif(X,Y,K):- X > Y,!, K is X -Y.
modDif(X,Y,K):-  K is Y - X.