% Estrutura de dados:
% 's' -> peça S
% 'o' -> peça O
% 'v' -> Sem peça
estado_inicial(e([v, v, v, v, v, v, s, s, s])).

% estado_inicial(e([s, v, v, s, s, s, s, s, o])).

% Em Linha
terminal(e([s, o, s, _, _, _, _, _, _])).
terminal(e([_, _, _, s, o, s, _, _, _])).
terminal(e([_, _, _, _, _, _, s, o, s])).

% Em Coluna
terminal(e([s, _, _, o, _, _, s, _, _])).
terminal(e([_, s, _, _, o, _, _, s, _])).
terminal(e([_, _, s, _, _, o, _, _, s])).

% Em Diagonal
terminal(e([s, _, _, _, o, _, _, _, s])).
terminal(e([_, _, s, _, o, _, s, _, _])).

% Terminou o espaco para jogar
terminal(e(L)):- \+ member(v, L).

% Funcao Utilidade
%Empate
valor(e(Estado), 0, _):- \+ member(v, Estado), !.

% Vitoria do Primeiro Jogador
valor(e(Estado), 1, Profundidade):- 
    terminal(e(Estado)),
    X is Profundidade mod 2, 
    X == 1,
    !.

% Vitoria do Segundo Jogador
valor(e(Estado), -1, _):- 
    terminal(e(Estado)),
    !.

% Operadores
% Operador1: Colocar a peca O
op1(e(EstadoAt), (o, Pos), e(EstadoSeg)) :- 
    place(EstadoAt, (o, Pos, 1), EstadoSeg).

% Operador2: Colocar a peca S
op1(e(EstadoAt), (s, Pos), e(EstadoSeg)) :- 
    place(EstadoAt, (s, Pos, 1), EstadoSeg).

% Funcao auxiliar
place([v|R], (J, Pos, Pos), [J|R]).
place([X|R], (J, Pos, N), [X|R1]) :-
    N1 is N + 1,
    place(R, (J, Pos, N1), R1).

% Funcao avaliacao
% findall da a lista de tds os valores, o soma soma esses valores do findall, o checkProf concerta de acordo com qm estiver a jogar.
avalia(e(Q), V):- findall(V1, aval(e(Q), V1), L), soma(L, V2), valor(e(Q), _, P), checkProf(V2, P, V).

% ter 2 peças em L/C/D
aval(e([s, v, s|_R]), V):- V = -2.
aval(e([s, o, v|_R]), V):- V = -2.
aval(e([v, o, s|_R]), V):- V = -2.

aval(e([s, _, _, v, _, _, s, _, _]), V):- V = -2.
aval(e([s, _, _, o, _, _, v, _, _]), V):- V = -2.
aval(e([v, _, _, o, _, _, s, _, _]), V):- V = -2.

aval(e([s, _, _, _, v, _, _, _, s]), V):- V = -2.
aval(e([_, _, s, _, v, _, s, _, _]), V):- V = -2.

% Ter 1 das peças bem posicionadas
aval(e([s| _R]), V):- V = 1.
aval(e([_, _, s| _R]), V):- V = 1.
aval(e([_, _, _, _, _, _, s |_R]), V):- V = 1.
aval(e([_, _, _, _, _, _, _, _, s]), V):- V = 1.

aval(e([_, o| _R]), V):- V = 1.
aval(e([_, _, _, o| _R]), V):- V = 1.
aval(e([_, _, _, _, o| _R]), V):- V = 1.
aval(e([_, _, _, _, _, o| _R]), V):- V = 1.
aval(e([_, _, _, _, _, _, _, o| _R]), V):- V = 1.

soma([], 0).
soma([X| R], V):- soma(R, V1), V is V1 + X.

checkProf(V2, P, V):-
    X is P mod 2,
    (X == 0,
    V is -V2);
    V = V2.