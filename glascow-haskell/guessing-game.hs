-- The program is going to be a guessing game, called Starman. In this single-player, text-based game, there is a word which the player needs to guess. For each turn of the game, the player guesses a single letter. If that letter is correct, then the guessed letters are displayed in the correct places in the word. If that letter is incorrect, then the user loses a star. Once the user has no stars left, they have lost the game. However if the user guesses all the letters in the word, they have won the game.

--"Good software engineers do specification before implementation"
check :: String -> String -> Char -> (Bool,String)
-- check: elem c word
-- display: if x == c then c else y | (x,y) <- zip word display]
check word display c
  = (c `elem` word, [if x==c
          then c
          else y | (x,y) <- zip word display])

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


