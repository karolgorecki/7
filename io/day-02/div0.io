// How would you change / to return 0 if the denominator is zero?
"Before" println
(10 / 5) println
(13 / 2) println
(10 / 0) println

old_div := Number getSlot("/")

Number / := method(n,
    if(n == 0,
        0,
        self old_div(n)
    )
)

"----" println
"After" println
(10 / 5) println
(13 / 2) println
(10 / 0) println
