% Estrutura de dados:
% 's' -> peça S
% 'o' -> peça O
% 'v' -> Sem peça
% Estado 1
% estado_inicial(e([v,v,v,v,v,s,s,s,s], 0, 0, turnIA)).

% Estado 2
% estado_inicial(e([s,v,v,v,s,v,v,s,v], 1, 0, turnPl)).

% Estado 3
% estado_inicial(e([v,s,v,s,v,s,v,v,s], 2, 1, turnIA)).

% Estado 4
% estado_inicial(e([s,s,v,v,v,v,s,v,v], 0, 2, turnPl)).

% Estado 5
% estado_inicial(e([v,v,s,v,s,v,s,v,v], 1, 1, turnIA)).

% Estado 6
% estado_inicial(e([s,v,v,s,v,v,s,s,v], 3, 0, turnPl)).

% Estado 7
% estado_inicial(e([v,s,v,s,v,s,v,s,v], 0, 3, turnIA)).

% Estado 8
% estado_inicial(e([s,v,s,v,s,v,v,s,v], 2, 2, turnPl)).

% Estado 9
% estado_inicial(e([v,v,v,s,s,s,v,v,v], 1, 2, turnIA)).

% Estado 10
% estado_inicial(e([s,s,v,v,s,v,v,s,v], 0, 0, turnPl)).

estado_inicial(e([v, v, v, v, v, v, v, v, v], 0, 0, turnPl)).

% Funcao terminal
% Todos os lugares tem pecas
terminal(e(L, _, _, _)) :- \+ member(v, L).

% Funcao Utilidade
% Vitoria do Segundo Jogador
valor(e(Tabuleiro, PtsPl, PtsIA, _), -1, _):- 
    terminal(e(Tabuleiro, PtsPl, PtsIA, _)),
    PtsPl > PtsIA,
    !.

% Fizeram a mesma quantidade de SOS
valor(e(Tabuleiro, PtsPl, PtsIA, _), 0, _):- 
    terminal(e(Tabuleiro, PtsPl, PtsIA, _)),
    PtsPl == PtsIA,
    !.
    
% Vitoria do Primeiro Jogador
valor(e(Tabuleiro, _, _, _), 1, _):- 
    terminal(e(Tabuleiro, _, _, _)),
    !.

% Operadores
% Operador1: Colocar a peca O (IA)
op1(e(TabuleiroAt, PtsPl, PtsIA, turnIA), (o, Pos), e(TabuleiroSeg, PtsPl, NewPtsIA, turnPl)) :- 
    place(TabuleiroAt, (o, Pos, 1), TabuleiroSeg),
    checkSOS(TabuleiroAt, TabuleiroSeg, PtsIA, NewPtsIA, turnIA).

% Operador2: Colocar a peca S (IA)
op1(e(TabuleiroAt, PtsPl, PtsIA, turnIA), (s, Pos), e(TabuleiroSeg, PtsPl, NewPtsIA, turnPl)) :- 
    place(TabuleiroAt, (s, Pos, 1), TabuleiroSeg),
    checkSOS(TabuleiroAt, TabuleiroSeg, PtsIA, NewPtsIA, turnIA).

% Operador3: Colocar a peca O (Player)
op1(e(TabuleiroAt, PtsPl, PtsIA, turnPl), (o, Pos), e(TabuleiroSeg, NewPtsPl, PtsIA, turnIA)) :- 
    place(TabuleiroAt, (o, Pos, 1), TabuleiroSeg),
    checkSOS(TabuleiroAt, TabuleiroSeg, PtsPl, NewPtsPl, turnPl).

% Operador4: Colocar a peca S (Player)
op1(e(TabuleiroAt, PtsPl, PtsIA, turnPl), (s, Pos), e(TabuleiroSeg, NewPtsPl, PtsIA, turnIA)) :- 
    place(TabuleiroAt, (s, Pos, 1), TabuleiroSeg),
    checkSOS(TabuleiroAt, TabuleiroSeg, PtsPl, NewPtsPl, turnPl).

% Funcao auxiliar
place([v|R], (J, Pos, Pos), [J|R]).
place([X|R], (J, Pos, N), [X|R1]) :-
    N1 is N + 1,
    place(R, (J, Pos, N1), R1).

% Verificar se o jogador fez pontos ao jogar
checkSOS(TabuleiroAt, TabuleiroSeg, PtsPl, NewPtsPl, turnPl):-
    conta_sos(TabuleiroAt, SOSAnt),
    conta_sos(TabuleiroSeg, SOSNov),
    Diff is SOSNov - SOSAnt,
    NewPtsPl is PtsPl + Diff. % Fazemos a diferença de SOS e adicionamos

% Verificar se a IA fez pontos ao jogar
checkSOS(TabuleiroAt, TabuleiroSeg, PtsIA, NewPtsIA, turnIA):-
    conta_sos(TabuleiroAt, SOSAnt),
    conta_sos(TabuleiroSeg, SOSNov),
    Diff is SOSNov - SOSAnt,
    NewPtsIA is PtsIA + Diff. % Fazemos a diferença de SOS e adicionamos

conta_sos(Tabuleiro, Total) :-
    findall(1, padrao_sos(Tabuleiro), Lista),
    length(Lista, Total).

% Padrões "SOS" nas linhas
padrao_sos([s, o, s, _, _, _, _, _, _]).
padrao_sos([_, _, _, s, o, s, _, _, _]).
padrao_sos([_, _, _, _, _, _, s, o, s]).

% Colunas
padrao_sos([s, _, _, o, _, _, s, _, _]).
padrao_sos([_, s, _, _, o, _, _, s, _]).
padrao_sos([_, _, s, _, _, o, _, _, s]).

% Diagonais
padrao_sos([s, _, _, _, o, _, _, _, s]).
padrao_sos([_, _, s, _, o, _, s, _, _]).

% Funcao avaliacao
% findall da a lista de tds os valores, o soma soma esses valores do findall, o checkProf concerta de acordo com qm estiver a jogar.
avalia(E, V):- findall(V1, aval(E, V1), L), soma(L, V).

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