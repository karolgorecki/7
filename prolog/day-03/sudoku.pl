sudoku(Puzzle, Solution) :-
  length(Puzzle, L),
  Size is floor(sqrt(L)),
 
  Solution = Puzzle,
  fd_domain(Solution, 1, Size),
    
  slice(Puzzle, Rows, Size, 'row'),
  slice(Puzzle, Cols, Size, 'col'),
  slice(Puzzle, Squares, Size, 'square'),
  
  valid(Rows),
  valid(Cols),
  valid(Squares),
        
  pretty_print(Rows).
 
valid([]).
valid([Head | Tail]) :- fd_all_different(Head), valid(Tail).
 
sublist_length([], _).
sublist_length([Head | Tail], Length) :- length(Head, Length), sublist_length(Tail, Length).
 
nth0(I, List, Out) :- I1 is I + 1, nth(I1, List, Out).
 
insert_into_slice(Item, Values, X, Y) :-
  nth0(X, Values, Bucket),
  nth0(Y, Bucket, Item).
 
slice_position('row', Size, I, X, Y) :-   
  X is I // Size,
  Y is I mod Size.
 
slice_position('col', Size, I, X, Y) :- 
  X is I mod Size,
  Y is I // Size.
  
slice_position('square', Size, I, X, Y) :- 
  Size_Sqrt is floor(sqrt(Size)),
  X is (I mod Size // Size_Sqrt) + (Size_Sqrt * (I // (Size * Size_Sqrt))),
  Y is (I mod Size_Sqrt) + (Size_Sqrt * ((I mod (Size * Size_Sqrt)) // Size)).
 
slice(Puzzle, Slice, Size, Type) :- slice(Puzzle, Slice, Size, Type, 0).
slice(_, Slice, Size, _, I) :- I is Size * Size, length(Slice, Size), sublist_length(Slice, Size).
slice([Head | Tail], Slice, Size, Type, I) :-
  slice_position(Type, Size, I, X, Y), 
  insert_into_slice(Head, Slice, X, Y),
  I1 is I + 1,
  slice(Tail, Slice, Size, Type, I1).
 
pretty_print([Head | Tail]) :-
  print(Head),
  print('\n'),
  pretty_print(Tail).