% Estado inicial do enunciado
% Quantos a esquerda(Canibal, Missias), quantos a direita, quantos no barco
estado_inicial(((3,3), ('e', 0), (0, 0))).

% Estado Final do enunciado
estado_final(((3,3), (_, 0), (0, 0))).

%op(EstadoAtual,operador,EstadoSeguinte,Custo)
% Colocar 2 canibais
op((A, B), ('e', 2), (C, D)) :- perder(C, D).
op((A, B), ('d', 2), (C, D)) :- perder(C, D).
% Colocar 2 missias

% Colocar 1 canibal e 1 missias

op((A,B),e(c1),(A1,B),1):- capacidade(c1,A1), A \= A1.
op((A,B),e(c2),(A,B1),1):- capacidade(c2,B1),B\=B1.
op((A,B),d(c1),(0,B),1):- A\= 0.
op((A,B),d(c2),(A,0),1):- B\=0.
op((A,B),d(c1,c2),(A2,B3),1):- capacidade(c2,B1), B2 is A+B,
                              min(B3,B1,B2), A3 is B2 - B3,
                              max(A2,A3,0), A\=A2,B\=B3.
op((B,A),d(c2,c1),(B3,A2),1):- capacidade(c1,B1), B2 is A+B, 
                              min(B3,B1,B2), A3 is B2 - B3,
                              max(A2,A3,0), A\=A2,B\=B3.

perder(A, B):- A > B, !.
perder(_, _).