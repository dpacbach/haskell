import Control.Monad
import Data.List (unfoldr)
import Utils

default (Int)

-- Monads

foo n = if n<5 then Nothing else Just (n-1)

chainNf :: (a -> a -> a) -> a -> Int -> a
chainNf bindf f n = foldr1 bindf · replicate n $ f

chainNMonad :: (Monad m) => (a -> m a) -> Int -> a -> m a
chainNMonad = chainNf (>=>)

chainNFunc :: (a -> a) -> Int -> a -> a
chainNFunc = chainNf (.)

--------------------------------------------------------------------------------
-- N Queens algorithm in the list monad

queens :: (Num a, Enum a, Num b) => a -> b -> [[a]]
queens m 0 = [[]]
queens m n = do
    qs <- queens m (n-1)
    q  <- [1..m]
    guard (safe q qs)
    return (q:qs)
    where
        safe q qs = and [ noattack q r | r <- enumerate1 qs ]
            where noattack q (i,x) = (q /= x) && (abs (q-x) /= i)

queensNN n = queens n n
queens88   = queens 8 8

--------------------------------------------------------------------------------
-- main

main :: IO ()
main = putStrLn "Hello"
