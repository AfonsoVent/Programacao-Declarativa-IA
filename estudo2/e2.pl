estado_inicial([base(5,1), sobre(4, 5), topo(1), sobre(3, 4), sobre(2, 3), sobre(1, 2), maoLivre(e), maoLivre(d), varaLimpa(2), varaLimpa(3)]).

% estado_final([base(5, 1), sobre(2, 3), sobre(1, 2), sobre(3, 4), topo(1), topo(3), sobre(4, 5), maoLivre(e), maoLivre(d)]).
% estado_final([base(5, 1), sobre(2, 3), sobre(3, 4), topo(2), topo(3), sobre(4, 5), maoSegura(1, e), maoLivre(d)]).

estado_final([base(5,1), sobre(4, 5), topo(2), sobre(3, 4), sobre(2, 3), maoSegura(1, e), maoLivre(d), varaLimpa(2), varaLimpa(3)]).

accao(segurarDisco(A, M),
    [maoLivre(M), topo(A), sobre(A, B)],
    [maoSegura(A, M), topo(B)],
    [maoLivre(M), topo(A), sobre(A, B)]) :-
        member(A, [1, 2, 3, 4, 5]),
        member(B, [1, 2, 3, 4, 5]),
        member(M, [e, d]).

accao(segurarDiscoDaBase(A, M),
    [maoLivre(M), topo(A), base(A, V)],
    [maoSegura(A, M), varaLimpa(V)],
    [maoLivre(M), topo(A), base(A, V)]) :-
        member(A, [1, 2, 3, 4, 5]),
        member(M, [e, d]),
        member(V, [1, 2, 3]).

accao(largarDisco(A, B, M),
    [maoSegura(A, M), topo(B)],
    [sobre(A, B), topo(A), maoLivre(M)],
    [maoSegura(A, M), topo(B)]) :-
        member(A, [1, 2, 3, 4, 5]),
        member(B, [1, 2, 3, 4, 5]),
        member(M, [e, d]),
        A < B.

accao(largarDiscoDaBase(A, M, V),
    [maoSegura(A, M), varaLimpa(V)],
    [base(A, V), topo(A), maoLivre(M)],
    [maoSegura(A, M), varaLimpa(V)]) :-
        member(A, [1, 2, 3, 4, 5]),
        member(M, [e, d]).