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

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f acc [] = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f acc [] = acc
foldr' f acc lst = foldr' f (f (last(lst)) acc) (init(lst))

l_words = ["kerfuffle","cacophony","rumpelstiltskin","ragamuffin","whippersnapper","gobbledygook","gibberish","poppycock","defenestrate","flummox","lackadaisical"]
get_fletter word = word !! 0
spell_word word = [(get_fletter word)] ++ " is for " ++ word
spell_book book = map (\x -> spell_word x) book
spell_book_string :: [[Char]] -> [Char]
spell_book_string spellbook = tail (tail (foldl (\x y -> x ++ "; " ++ y) "" spellbook))
print_spellbook :: String -> IO ()
print_spellbook book = print book
main' dict = print_spellbook (spell_book_string (spell_book dict)) 