--variables: number of guesses (stars), word, guess character, temp word
-- if stars == 0, lose; if temp_word == word, win

check_guess :: Char -> [Char] -> Bool
check_guess guess word =
    if elem guess word then True else False


        