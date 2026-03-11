estado_inicial(e([  v(c((1, 1)), [1, 2, 3, 4], 2),
                    v(c((1, 2)), [1, 2, 3, 4], _),
                    v(c((1, 3)), [1, 2, 3, 4], _),
                    v(c((1, 4)), [1, 2, 3, 4], _),
                    v(c((2, 1)), [1, 2, 3, 4], _),
                    v(c((2, 2)), [1, 2, 3, 4], _),
                    v(c((2, 3)), [1, 2, 3, 4], _),
                    v(c((2, 4)), [1, 2, 3, 4], _),
                    v(c((3, 1)), [1, 2, 3, 4], _),
                    v(c((3, 2)), [1, 2, 3, 4], _),
                    v(c((3, 3)), [1, 2, 3, 4], _), 
                    v(c((3, 4)), [1, 2, 3, 4], _),
                    v(c((4, 1)), [1, 2, 3, 4], _),
                    v(c((4, 2)), [1, 2, 3, 4], _),
                    v(c((4, 3)), [1, 2, 3, 4], _),
                    v(c((4, 4)), [1, 2, 3, 4], _)], [v(c((1, 1)), [1, 2, 3, 4], 2)])).

ve_restricoes(e(_NotInstanciado, YesInstanciado)) :-
        \+ linhaErradaTodos(YesInstanciado),
        \+ colunaErradaTodos(YesInstanciado).

linhaErradaTodos(YesInstanciado) :- 
    member(X, [1, 2, 3, 4]),
    findall(V, member(v(c(X, _Y), _, V), YesInstanciado), PL), 
    linhaErrada(PL).

% Verifica se repete (funciona)
linhaErrada([X| R]):- member(X, R), !.
linhaErrada([_| R]):- linhaErrada(R). 

colunaErradaTodos(YesInstanciado) :- 
    member(Y, [1, 2, 3, 4]),
    findall(V, member(v(c(_X, Y), _, V), YesInstanciado), PL), 
    linhaErrada(PL).

% [v(c((4,4)),[1,2,3,4],1),
% v(c((4,3)),[1,2,3,4],1),
% v(c((4,2)),[1,2,3,4],1),
% v(c((4,1)),[1,2,3,4],1),
% v(c((3,4)),[1,2,3,4],1),
% v(c((3,3)),[1,2,3,4],1),
% v(c((3,2)),[1,2,3,4],1),
% v(c((3,1)),[1,2,3,4],1),
% v(c((2,4)),[1,2,3,4],1),
% v(c((2,3)),[1,2,3,4],1),
% v(c((2,2)),[1,2,3,4],1),
% v(c((2,1)),[1,2,3,4],1),
% v(c((1,4)),[1,2,3,4],1),
% v(c((1,3)),[1,2,3,4],1),
% v(c((1,2)),[1,2,3,4],1),
% v(c((1,1)),[1,2,3,4],1)]