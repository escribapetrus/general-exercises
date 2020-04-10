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

data Tree = Leaf | Node Int Tree Tree deriving Show

treeDepth :: Tree -> Int
treeDepth Leaf = 0
treeDepth (Node _ lef rig) = 1 + max (treeDepth lef) (treeDepth rig)

val' :: Tree -> Int
val' Leaf = 0
val' (Node x lef rig) = x + (val' lef) + (val' rig)

isSorted :: Tree -> Int -> Int -> Bool
isSorted Leaf _ _ = True
isSorted (Node x lef rig) min' max' =
    x >= min' && x < max' && lefSorted && rigSorted
    where
        lefSorted = isSorted lef min' x
        rigSorted = isSorted rig x max'
-- to check isSorted, call function with tree, minBound, maxBound as values

newMax :: Tree -> Tree
newMax Leaf = Node 0 Leaf Leaf
newMax (Node x t1 Leaf) = Node x t1 (Node (x + 1) Leaf Leaf)
newMax (Node x t1 t2) = Node x t1 (newMax t2)

-- exercise: insert a value into a tree in order
insertVal :: Tree -> Int -> Tree
insertVal (Node x rig lef) y = Node y rig lef

subst' :: Tree -> Int -> Int -> Tree
subst' Leaf _ _ = Leaf
subst' (Node x rig lef) find sub =
    if x == find then Node sub (subst' rig find sub) (subst' lef find sub)
    else Node x (subst' rig find sub) (subst' lef find sub)

-- exercise: convert a Tree into a list
-- recursive cons operation
listify :: Tree -> [Int]
listify Leaf = []
listify (Node x rig lef) = x : listify rig ++ listify lef

m = Node 0 (Node 0 Leaf (Node 1 Leaf (Node 2 Leaf (Node 3 Leaf (Node 0 Leaf (Node 1 Leaf (Node 2 Leaf (Node 3 Leaf Leaf)))))))) (Node 1 Leaf (Node 2 Leaf (Node 3 Leaf Leaf)))