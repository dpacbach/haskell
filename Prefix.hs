module Prefix (commonURLPath) where

--import Data.List (transpose)
import Utils

-------------------------------------------------------------

--Smallest one
--commonPrefix2 :: (Eq a) => [a] -> [a] -> [a]
--commonPrefix2 = zipWithWhile first (==) 

--Inefficient
--commonPrefix2 :: (Eq a) => [a] -> [a] -> [a]
--commonPrefix2 x y = last · takeWhile (`isPrefixOf` x) $ inits y 

--Requires no other functions
--commonPrefix2 :: (Eq a) => [a] -> [a] -> [a]
--commonPrefix2 x y = fst · unzip · takeWhile (\(x,y) -> x==y) $ zip x y

--commonPrefix2 :: (Eq a) => [a] -> [a] -> [a]
--commonPrefix2 x y = map fst $ zipWhile (==) x y

--commonPrefix2 :: (Eq a) => [a] -> [a] -> [a]
--commonPrefix2 x y = [w | (w,v) <- zipWhile (==) x y]

--commonPrefix :: (Eq a) => [[a]] -> [a]
--commonPrefix = foldr1 commonPrefix2

------------------------------------------------------------- 

--transposeCut :: [[a]] -> [[a]]
--transposeCut l = takeWhile ((length l ==) · length) $ transpose l

--commonPrefix :: (Eq a) => [[a]] -> [a]
--commonPrefix = map head · takeWhile uniform · transposeCut

------------------------------------------------------------- 

--commonURLPath2 :: [[Char]] -> [Char]
--commonURLPath2 = joinBegin "/" · commonPrefix · map (splitIgnore "/")

--commonURLPath :: [String] -> String
--commonURLPath = joinBegin "/" · foldr1 (zipWithWhile first (==)) · map (splitIgnore "/")

(unslashes, slashes) = (join "/", split "/")

--commonPrefix :: (Eq a) => [a] -> [a] -> [a]
commonPrefix x y = [w | (w,v) <- zip x y, w == v]

--commonURLPath :: [String] -> String
commonURLPath = unslashes . foldr1 commonPrefix . map slashes
