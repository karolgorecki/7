reverse([], []).
reverse([X], [X]).

reverse(R, [Head|Tail]) :-
    reverse(Rx, Tail),
    append(Rx, [Head], R).



small(X, [X]).

small(X, [Head|Tail]) :-
    small(Xs, Tail),
    X is min(Head, Xs).


sort_list([], []).

sort_list([Head], [Head]).

sort_list([First, Second | Tail], Sorted) :-
  divide([First, Second | Tail], Left, Right),
  sort_list(Left, LeftSorted),
  sort_list(Right, RightSorted),
  merge(LeftSorted, RightSorted, Sorted).
 
merge(LeftList, [], LeftList).
merge([], RightList, RightList).

merge([LeftHead | LeftTail], [RightHead | RightTail], [LeftHead | Merged]) :- 
  LeftHead =< RightHead,
  merge(LeftTail, [RightHead | RightTail], Merged).

merge([LeftHead | LeftTail], [RightHead | RightTail], [RightHead | Merged]) :- 
  LeftHead > RightHead, 
  merge([LeftHead | LeftTail], RightTail, Merged).  
  
divide([], [], []).
divide([Head], [Head], []).

divide([First, Second | Tail], [First | Left], [Second | Right]) :-
  divide(Tail, Left, Right).