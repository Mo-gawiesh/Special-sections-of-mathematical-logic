parent(gamiel,mohamed).
parent(gamiel,saif).
parent(gamiel,gana).
parent(hoda,mohamed).
parent(hoda,gana).
parent(hoda,saif).
parent(ahmed,gamiel).
parent(zeina,gamiel).
parent(zakaria,hoda).
parent(hana,hoda).
parent(zakaria,mustafa).
parent(hana,mustafa).
parent(zakaria,ibrahim).
parent(hana,ibrahim).
parent(ahmed,mohamed).
parent(ahmed,naira).
parent(zeina,mohamed).
parent(zeina,naira).
male(ahmed).
male(mohamed).
male(gamiel).
male(mohamed).
male(saif).
male(zakaria).
male(mustafa).
male(ibrahim).
female(zeina).
female(naira).
female(gana).
female(hana).
female(hoda).
% Define birthdays
birthday(gamiel, 1, january, 1970).
birthday(hoda, 14, february, 1975).
birthday(gana, 7, july, 2005).
birthday(mohamed, 12, december, 1999).
birthday(saif, 14, january, 2001).
% Define seasons
summer(june).
summer(july).
summer(august).


% Check if a birthday falls in Summer
birthday_in_summer(Person) :-
    birthday(Person, _, Month, _),
    summer(Month).

% List all individuals born in summer
birthday_in_summer :-
    write("Who was born in summer: "), nl,
    findall(Person, birthday_in_summer(Person), Persons),
    print_list(Persons).

% Helper predicate to print a list
print_list([]).
print_list([X|Xs]) :-
    write(X), nl,
    print_list(Xs).
job(mohamed,engineer).
job(gamiel,engineercompany).
job(hoda,teacher).
job(ahmed,doctor).
father(X,Y) :- parent(X,Y),male(X).
sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X),X\==Y.
mother(X,Y) :- parent(X,Y),female(X).
siblings(X,Y) :- parent(Z,X), parent(Z,Y), X\==Y.
son(X,Y):-parent(X,Y),male(X).
son(X,Y):-parent(X,Y),female(X).
jobb(X,Y):-job(X,Y),male(X).
grandfather(X,Y):- parent(X,Z),parent(Z,Y),male(X).
grandmother(X,Y):- parent(X,Z),parent(Z,Y),female(X).
uncle(X,Z):- parent(Y,Z),parent(G,Y),parent(G,X),X\==Y.
goal1 :- parent(gamiel,gana),female(gana).
goal2 :- parent(gamiel,_),male(ahmed).
goal3 :- writeln("Zeina's grandchildren are:"),
         parent(zeina, X),  % Zeina's children
         parent(X, Grandchild),  % Grandchildren of Zeina
         writeln(Grandchild),
         fail.
goal4 :- (parent(mohamed, medo) -> writeln("medo is a child of mohamed."),
          true;
          (parent(gamiel, mohamed) -> writeln("mohamed is a child of gamiel."),
          true)).
