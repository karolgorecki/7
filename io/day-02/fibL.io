// FIBONACCI LOOP
// A Fibonacci sequence starts with two 1s.
// Each subsequent num- ber is the sum of the two numbers that came 
// before: 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3.
// As a bonus, solve the problem with recursion and with loops.

fibL := method(n,
    if(n < 2, n,
        sum := 0
        n1 := 0
        n2 := 1

        for(a, 2, n, 
            sum = n1 + n2
            n1 = n2
            n2 = sum
        )
        sum
    )
)
// Should be
// 0 : 0
// 1 : 1
// 2 : 1
// 3 : 2
// 4 : 3
// 5 : 5
// 6 : 8 = 23
// 7 : 13
// 8 : 21 = 3 x 7
// 9 : 34 = 2 x 17
// 10 : 55 = 5 x 11
// 11 : 89

(fibL(0) .. " = 0") println
(fibL(1) .. " = 1") println
(fibL(2) .. " = 1") println
(fibL(3) .. " = 2") println
(fibL(4) .. " = 3") println
(fibL(7) .. " = 13") println
(fibL(8) .. " = 21") println
(fibL(9) .. " = 34") println
