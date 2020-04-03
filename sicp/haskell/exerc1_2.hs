-- procedures and the processes they generate

-- factorial
fac x = 
    if x == 1 
        then x 
        else x * fac (x - 1)

fac_iter_iter product counter x = 
    if counter > x
        then product
        else fac_iter_iter (counter * product) (counter + 1) x
fac_iter x = fac_iter_iter 1 1 x

-- ex 1.9

-- fibonacci
fib x = 
    if x == 0 then 0
    else if x == 1 then 1
    else fib (x-1) + fib (x-2)  

-- ex 1.10 ACKERMANN'S
ack x y = 
    if y == 0 then 0
    else if x == 0 then y * 2
    else if y == 1 then 2
    else ack (x-1) (ack x (y-1))

