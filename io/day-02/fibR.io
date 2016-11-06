// FIBONACCI RECURSION
// A Fibonacci sequence starts with two 1s.
// Each subsequent num- ber is the sum of the two numbers that came 
// before: 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3.
// As a bonus, solve the problem with recursion and with loops.

fibR := method(n, if(n < 2, n, fibR(n - 1) + fibR(n - 2)))
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
fibR(0) println
fibR(1) println
fibR(4) println
fibR(7) println
