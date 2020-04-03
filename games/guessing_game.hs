-- game: start with a word, status (empty) and x lives
-- turn: win || lose || guess
-- guess: take letter -> update status or lose life

takeguess status word lives =
    do  putStrLn "Enter guess: "
        guess <- getLine
        if elem (guess !! 0) word
            then taketurn (update_status guess word status) word lives
            else taketurn status word (lives - 1)

taketurn status word lives = 
    do  putStrLn (status ++ "  lives: " ++ take lives (repeat '*'))
        if (status == word) then putStrLn "You win!!"
        else if (lives == 0) then putStrLn "You lose!!"
        else takeguess status word lives

update_status :: [Char] -> String -> String -> String
update_status guess word status = 
    let jackie = zip word status
        jenny = [if x == guess !! 0 then x else y | (x,y) <- jackie]
    in jenny

game word lives = taketurn ['_' | x <- word] word lives