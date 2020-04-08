l_words = ["kerfuffle","cacophony","rumpelstiltskin","ragamuffin","whippersnapper","gobbledygook","gibberish","poppycock","defenestrate","flummox","lackadaisical"]


spell_word word = [(word !! 0)] ++ " is for " ++ word

spell_book book = map (\x -> spell_word x) book
spell_book_string :: [[Char]] -> [Char]
spell_book_string spellbook = tail (tail (foldl (\x y -> x ++ "; " ++ y) "" spellbook))

print_spellbook :: String -> IO ()
print_spellbook book = print book

main' dict = print_spellbook (spell_book_string (spell_book dict)) 