main(X, _) :-
    abs(X) >= 1,
    write('Error: |x| must be less than 1.'),
    !.
main(X, N) :-
    std_value(X, Std),
    app_value(X, N, 0, 0, App),
    abs_error(Std, App, AbsError),
    format('Std(~1f) = ~6f\n', [X, Std]),
    format('Approx(~1f) = ~6f\n', [X, App]),
    format('(n = ~d)\n', [N]),
    format('AbsError = ~6f\n', [AbsError]).

std_value(X, Std) :-
    Std is 1 / (1 + X) ** 4.

app_value(_, N, N, Sum, Sum) :- !.
app_value(X, N, I, Sum, App) :-
    I1 is I + 1,
    choose(3 + I, I, Coeff),
    NewSum is Sum + (-1) ** I * Coeff * X ** I,
    app_value(X, N, I1, NewSum, App).

abs_error(Std, App, AbsError) :-
    AbsError is abs(Std - App).

choose(N, K, Choose) :-
    fact(N, FactN),
    fact(K, FactK),
    fact(N - K, FactNK),
    Choose is FactN / (FactK * FactNK).

fact(0, 1) :- !.
fact(N, Fact) :-
    N1 is N - 1,
    fact(N1, Fact1),
    Fact is N * Fact1.
