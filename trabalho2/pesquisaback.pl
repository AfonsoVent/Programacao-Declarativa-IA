p:- estado_inicial(E0), back(E0,A), esc(A).

esc(A):- write(A), nl.

back(e([],A),A).
back(E,Sol):- sucessor(E,E1), ve_restricoes(E1),
                          back(E1,Sol).

sucessor(e([v(N, D, V)| R], L), e(R, [v(N, D, V)| L])):- member(V, D).