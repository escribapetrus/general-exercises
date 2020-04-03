#Building abstractions with procedures
# exerc 1-2
def oneone():
    upper = 5 + 4 + (2 - (3 - (6 + (4 / 5))))
    lower = 3 * (6 - 2) * (2 - 7)
    return upper / lower

#exerc 1-3
def gethigh(x,y,z):
    def squaresum(x,y):
        return (x * x) + (y * y)
    if (x <= y or x <= z):
        return squaresum(y,z)
    elif (y <= x or y <= z):
        return squaresum(x,z)
    else:
        return squaresum(y,x)

# exerc 1-4
# Procedure makes takes absolute value of b by adding - operand if b < 0, then adds to a.
def aplusabsbab(a,b):
    if (b > 0):
        return a + b
    else:
        return a - b

#exerc 1-5
#in normal order evaluation, the expression evaluates step by step to 0. In applicative order, function p expands infinitely to itself.
p = lambda p: p
def test(x,y):
    if (x == 0):
        return 0
    else:
        return y

#squareroot
#squareroot programs consists of: target x, guess y, thruth criteria, and increment (of which average is a subroutine)
def squareroot(x):
    average = lambda a, b: (a+b)/2 
    increment = lambda y: average(y,(x/y))
    def squarerootloop(y):
        if ((y*y) == x):
            return y
        else:
            return squarerootloop(increment(y))
    return squarerootloop(1)
 
# exerc 1-8
# Problem: Python has a low limit for recursion by default. How to fix this?
def cuberoot(x):
    increment = lambda y: ((x/(y*y))+(2*y))/3
    def cuberootloop(y):
        if (pow(y,3) == x):
            return y
        else:
            return cuberootloop(increment(y))
    return cuberootloop(1)




