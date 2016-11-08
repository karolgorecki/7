likes(edek, cheese).
likes(adam, cheese).
likes(jan, sheep).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).