length' [] = 0
length' (x:xs) = 1 + length xs

length'' lst =
    if lst == [] then 0
    else let (x:xs) = lst in 1 + length'' xs

length_'' lst
    | lst == [] = 0
    | otherwise = let (x:xs) = lst in 1 + length xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' pred lis
    | null lis = []
    | otherwise = if pred x
        then (x:filter' pred xs)
        else filter pred xs
            where x:xs=lis

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' pred [] = []
filter'' pred (x:xs) =
    if pred x then (x:filter'' pred xs)
    else filter pred xs

-- map f (map g xs) = map (f . g) xs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' fun (x:xs) = (fun x:map' fun xs)
-- how to exhaust this?
