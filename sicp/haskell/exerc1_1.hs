-- ex 1.2
ex1_1 = 
    let upper = 5 + 4 + (2 - (3 - (6 + (4 / 5))))
        lower = 3 * (6 - 2) * (2 - 7)
    in upper / lower

-- ex 1.3
--take 2 larger of three, return sum of squares
maxof3 :: Int -> Int -> Int -> [Int]
maxof3 x y z = 
    if x <= y && x <= z
        then [y,z]
        else if y <= x && x <= z
            then [x,z]
            else [x,y]
squaresum [x,y] = x*x + y*y

-- ex 1.4
-- a plus absolute b
-- conditionally apply the operator according to the value of b
a_plus_absb a b = (if b > 0 then (+) else (-)) a b

--ex 1.5
p = p
test x y = if x == 0 then 0 else p

-- square roots
-- sqrtt x = y for y >= 0 and y*y == x
-- successive approximations: take a guess, then improve the guess and guess again recursively
avg x y = (x + y) / 2
isGood x y = (abs (x - y*y)) < 0.0001
improve x y = avg y (x / y)
sqrtiter x y = if isGood x y then y else sqrtiter x (improve x y)
sqrtt x = sqrtiter x 1
-- sqrtt x = guess 1
--     where 
--         avg = \a b -> (a + b) /2
--         improve = \a b -> avg b (a / b)
--         guess y = if y*y == x then y else guess (improve y x)

-- ex 1.8 cube roots
-- cbrt x = y for y*y*y == x
-- isCubeGood x y = y*y*y == x --(abs (x - y*y*y)) < 0.0001
improvecb = \x y -> ((x/(y*y))+(2*y))/3
cbrtiter x y = if (abs (x - y*y*y)) < 0.0001 then y else cbrtiter x (improvecb x y)
cbrt x = cbrtiter x 1



