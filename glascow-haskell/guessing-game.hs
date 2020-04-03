-- The program is going to be a guessing game, called Starman. In this single-player, text-based game, there is a word which the player needs to guess. For each turn of the game, the player guesses a single letter. If that letter is correct, then the guessed letters are displayed in the correct places in the word. If that letter is incorrect, then the user loses a star. Once the user has no stars left, they have lost the game. However if the user guesses all the letters in the word, they have won the game.

--"Good software engineers do specification before implementation"
check :: String -> String -> Char -> (Bool,String)
-- check: elem c word
-- display: if x == c then c else y | (x,y) <- zip word display]
check word display c
  = (c `elem` word, [if x==c then c else y | (x,y) <- zip word display])

turn :: String -> String -> Int -> IO ()
-- if n == 0 you lose
-- if word == display you win
turn word display n =
    do if n==0
        then putStrLn "You Lose"
        else if word == display
            then putStrLn "You win!"
            else mkguess word display n

-- mkguess :: String -> [Char] -> Int -> IO ()
mkguess word display n =
  do putStrLn (display ++ "  " ++ take n (repeat '*'))
     putStr "  Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (q!!0)
     let n' = if correct then n else n-1
     turn word display' n'

starman :: String -> Int -> IO ()
starman word n = turn word ['-' | x <- word] n


-- ########## MY SOLUTION:

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