% estado_inicial([sobre(a, b), sobre(b, c), sobre(c, d), topo(a), chao(d), maoLivre(e), maoLivre(d)]).

% estado_final([sobre(c, d), topo(c), maoSegurar(a, e), maoSegurar(b, d)]).

estado_inicial([sobre(a, b), chao(b), chao(d), topo(a), topo(d), maoSegurar(c, e), maoLivre(d)]).

estado_final([sobre(a, b), chao(b), chao(c), topo(a), topo(c), maoSegurar(d, e), maoLivre(d)]).

accao(segurarBlocoDaTorre(A, M),
    [maoLivre(M), topo(A), sobre(A, B)],
    [maoSegurar(A, M), topo(B)],
    [maoLivre(M), topo(A), sobre(A, B)]) :-
        member(A, [a, b, c, d]),
        member(B, [a, b, c, d]),
        member(M, [e, d]).

accao(segurarBlocoDoChao(A, M),
    [maoLivre(M), topo(A), chao(A)],
    [maoSegurar(A, M)],
    [maoLivre(M), topo(A), chao(A)]) :-
        member(A, [a, b, c, d]),
        member(M, [e, d]).

accao(largarBlocoNaTorre(A, B, M),
    [maoSegurar(A, M), topo(B)],
    [maoLivre(M), topo(A), sobre(A, B)],
    [maoSegurar(A, M), topo(B)]) :-
        member(A, [a, b, c, d]),
        member(B, [a, b, c, d]),
        member(M, [e, d]).

accao(largarBlocoNoChao(A, M),
    [maoSegurar(A, M)],
    [maoLivre(M), topo(A), chao(A)],
    [maoSegurar(A, M)]) :-
        member(A, [a, b, c, d]),
        member(M, [e, d]).