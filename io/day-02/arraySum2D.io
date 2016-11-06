// Write a program to add up all of the numbers in a two-dimensional array.

List sum2d := method(
    sum := 0
    self foreach(i, v,
        v foreach(idx, val,
            sum := sum + val
        )
    )

    sum
)
a2d := list(
    list(1, 2, 3),
    list(10, 20, 30),
    list(100, 200, 300)
)

a2d sum2d println