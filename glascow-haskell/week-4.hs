gen_add_n = \n -> \x -> x + n
gen_op_n = \op n -> \x -> x `op` n

add_four = gen_add_n 4
divide_two = gen_op_n (/) 2

data Tag = MkTag String deriving Show

parseTag :: Parser MkTag
parseTag = do char '<' 
            x <- identifier
            char '>'
            return (MkTag x)
