% Estado inicial
estado_inicial(e([  v(c((2, 2)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((2, 3)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((3, 2)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((3, 3)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((3, 4)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((3, 6)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((4, 3)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((4, 4)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((4, 5)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((4, 6)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((5, 2)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((5, 5)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((6, 2)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _),
                    v(c((6, 4)), [1, 2, 3, 4, 5, 6, 7, 8, 9], _)],
                    [
                    v(c((2, 4)), [1, 2, 3, 4, 5, 6, 7, 8, 9], 4),
                    v(c((3, 5)), [1, 2, 3, 4, 5, 6, 7, 8, 9], 4),
                    v(c((5, 3)), [1, 2, 3, 4, 5, 6, 7, 8, 9], 2),
                    v(c((5, 4)), [1, 2, 3, 4, 5, 6, 7, 8, 9], 5),
                    v(c((6, 3)), [1, 2, 3, 4, 5, 6, 7, 8, 9], 8)
                    ])).

% Restricoes
ve_restricoes(e(_NotInst, Inst)):-
    \+ (linhas(Inst);
    colunas(Inst);
    condicoes(Inst)).

condicoes(Inst):-
    linha(Inst, 2, 3, 20);      % A soma da 2ª linha tem que ter 3 valores e tem que dar 20. 
    linha(Inst, 3, 5, 23);      % A soma da 3ª linha tem que ter 5 valores e tem que dar 23. 
    linha(Inst, 4, 4, 14);      % A soma da 4ª linha tem que ter 4 valores e tem que dar 14. 
    linha(Inst, 5, 4, 23);      % A soma da 5ª linha tem que ter 4 valores e tem que dar 23. 
    linha(Inst, 6, 3, 19);      % A soma da 6ª linha tem que ter 3 valores e tem que dar 19.

    coluna(Inst, 3, 5, 26);     % A soma da 3ª coluna tem que ter 5 valores e tem que dar 26. 
    coluna(Inst, 4, 5, 28);     % A soma da 4ª coluna tem que ter 5 valores e tem que dar 28. 
    coluna(Inst, 5, 3, 18);     % A soma da 5ª coluna tem que ter 3 valores e tem que dar 18. 
    coluna(Inst, 6, 2, 3);      % A soma da 6ª coluna tem que ter 2 valores e tem que dar 3. 

    subColuna(Inst, 2, 2, 13, [2, 3]);  % A soma da 2ª coluna tem que ter 2 valores e tem que dar 13, e é restrito com x = [2, 3]. 
    subColuna(Inst, 2, 2, 11, [5, 6]).  % A soma da 2ª coluna tem que ter 2 valores e tem que dar 11, e é restrito com x = [4, 6].

% Predicados auxiliares
% Linhas so verifica se repetiu na linha
linhas(Inst) :- 
    member(X, [2, 3, 4, 5, 6]),
    findall(V, (member(v(c(X, _Y), _, V), Inst), integer(V)), PL),
    repete(PL).

% Colunas so verifica se repetiu na coluna
colunas(Inst) :- 
    member(Y, [2, 3, 4, 5, 6]),
    findall(V, (member(v(c(_X, Y), _, V), Inst), integer(V)), PL),
    repete(PL).

% Verifica se repete (funciona)
repete([X| R]):- member(X, R).
repete([_| R]):- repete(R).

% Verifica se na linha tem tds os valores bem preenchidos e se faz a soma que deveria
linha(Inst, Lin, QuantiaEsperada, SomaEsperada) :-
    findall(V, (member(v(c((Lin, _Y)), _, V), Inst), integer(V)), Valores),
    length(Valores, Quantia),
    Quantia == QuantiaEsperada,
    soma(Valores, Soma),
    Soma \= SomaEsperada.

% Verifica se na coluna tem tds os valores bem preenchidos e se faz a soma que deveria
coluna(Inst, Col, QuantiaEsperada, SomaEsperada) :-
    findall(V, (member(v(c((_X, Col)), _, V), Inst), integer(V)), Valores),
    length(Valores, Quantia),
    Quantia == QuantiaEsperada,
    soma(Valores, Soma),
    Soma \= SomaEsperada.

subColuna(Inst, Col, QuantiaEsperada, SomaEsperada, Dominio) :-
    findall(V, 
        (member(X, Dominio),
         member(v(c((X, Col)), _, V), Inst),
         integer(V)
        ), Valores),
    length(Valores, Quantia),
    Quantia == QuantiaEsperada,
    soma(Valores, Soma),
    Soma \= SomaEsperada.

soma([], 0).
soma([H|T], S) :-
    soma(T, S1),
    S is H + S1.
