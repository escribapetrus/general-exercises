-- -- infinite list os consecutive numbers
-- [1..]
-- --infinite list of same number
-- repeat 1
-- -- take function takes n elements of infinite list
-- take 7 [1..]
-- -- drop first n elements of infinite list
-- drop 4 [1..]

-- fibonacci infinite sequence:
fibs = 1:1:(zipWith (+) fibs (tail fibs))

--infinite list of factorials
factorials = map (\x -> (foldr (*) 1 [1..x])) [1..]

--filter expressions for infinite list of prime numbers
properfactors :: Int -> [Int]
properfactors x = filter (\y->(x `mod` y==0)) [2..(x-1)]

numproperfactors :: Int -> Int
numproperfactors x = length (properfactors x)

primes :: [Int]
primes = filter (\x -> (numproperfactors x == 0)) [2..]

