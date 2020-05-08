module Main where
import ShowParser ( parseShow )

data PersonRecord = MkPersonRecord {
    name :: String,
    address :: Address,
    id :: Integer,
    labels :: [Label]
} deriving (Show)

data Address = MkAddress {
    line1 :: String,
    number :: Integer,
    street :: String,
    town :: String,
    postcode :: String
} deriving (Show)

data Label = Green | Red | Blue | Yellow deriving (Show)

rec1 = MkPersonRecord
    "John Doe"
    (MkAddress "Over the Hills" 65 "Moore Street" "Dublin" "234324-101")
    34293752
    [Green, Red]

rec2 = MkPersonRecord
    "Jane Doe"
    (MkAddress "Blackmore Heights" 23 "Stargazer Av." "London" "49293-010")
    254645
    [Blue, Yellow]

recs = show [rec1,rec2]

main = putStrLn $ parseShow recs