module Main where

import Data.List
import Data.Char
import Control.Monad
import System.Random
import System.IO
import TUI

pegs :: [Char]
pegs = ['a'..'f']

nbPegs :: Int
nbPegs = 4

type Guess = [Char]
type Score = (Int, Int)

allGuesses :: Int -> [Guess]
allGuesses n = init : filter (/=init) (all n)
    where
        init = take n $ cycle pegs
        all 0 = [[]]
        all n = [p:ps | p <- pegs, ps <- all (n-1)]

calcScore :: Guess -> Guess -> Score
calcScore secret guess = (right, wrong)
    where
        right = sum [1 | (x,y) <- zip secret guess, x == y]
        notFound = secret \\ guess
        wrong = length secret - length notFound - right

makeGuess :: Guess -> Score -> [Guess] -> [Guess]
makeGuess guess (right, wrong) =
    filter (\g -> calcScore g guess == (right, wrong))

parseScore :: String -> Maybe Score
parseScore [r, w]
    | valid right && valid wrong && valid (right+wrong)
        = Just (right, wrong)
    where valid n = 0 <= n && n <= nbPegs
          right = ord r - ord '0'
          wrong = ord w - ord '0'
parseScore _ = Nothing

randomPegs :: [IO Char]
randomPegs = fmap ( (pegs!!).(`mod`length pegs) ) randomIO : randomPegs

randomSecret :: IO Guess
randomSecret = sequence $ take nbPegs randomPegs

human :: IO ()
human = do
    putStrLn ""
    secret <- randomSecret
    humanTurn 1 secret

humanTurn :: Int -> Guess -> IO ()
humanTurn n secret = do
    guess <- readLine $ "Human turn " ++ show n ++ ": "
    if length guess /= nbPegs
        then humanTurn n secret
        else do
            let (right, wrong) = calcScore secret guess
            putStrLn $ "score: " ++ show right ++ "-" ++ show wrong
            if right == nbPegs
                then putStrLn "Congratulation!"
                else humanTurn (n+1) secret

computer :: IO ()
computer = do
    putStrLn ""
    computerTurn 1 $ allGuesses nbPegs

computerTurn :: Int -> [Guess] -> IO ()
computerTurn n (guess:guesses) = do
    --putStrLn $ "Possible guesses: " ++ show (1 + length guesses)
    s <- readLine $ "Computer turn " ++ show n ++ ": " ++ show guess ++ " => "
    let score = parseScore s
    case score of
        Nothing -> computerTurn n (guess:guesses)
        Just (right, wrong) ->
            if right < nbPegs
                then computerTurn (n+1) $ makeGuess guess (right, wrong) guesses
                else putStrLn "I'm the best!"

computerTurn n [] =
    putStrLn "You, cheater! You've made a mistake, haven't you?"

both :: IO ()
both = do
    putStrLn ""
    secret <- randomSecret
    bothTurn secret 1 $ allGuesses nbPegs

bothTurn :: Guess -> Int -> [Guess] -> IO ()
bothTurn secret n (guess:guesses) = do
    --putStrLn $ "Possible guesses: " ++ show (1 + length guesses)
    putStr $ "Computer turn " ++ show n ++ ": " ++ show guess ++ " => "
    hFlush stdout
    let (right, wrong) = calcScore secret guess
    putStrLn $ show right ++ show wrong
    if right < nbPegs
        then bothTurn secret (n+1) $ makeGuess guess (right, wrong) guesses
        else putStrLn "I'm the best!"

main :: IO ()
main = do
    putStrLn ""
    menu ["Mastermind in Haskell"]
        [   ('H', "Human player", human >> main),
            ('C', "Computer player", computer >> main),
            ('B', "Both players are computers", both >> main),
            ('Q', "Quit", return ())
        ]
    putStrLn ""