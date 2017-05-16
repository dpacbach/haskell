module Hyphen ( hyphenateEnglish
              , hyphenChunks
              , dehyphenate
              ) where

import Text.Hyphenation (hyphenate, english_US)
import Utils            (endsWith, startsWith)

hyphenateEnglish :: String -> [String]
hyphenateEnglish = hyphenate english_US

-- We can't do this with a  simple  map operation because we need
-- to join adjacent words after removing a hyphen.
dehyphenate :: [String] -> [String]
dehyphenate (x:y:rest)
    | x`startsWith`"-" = x:dehyphenate (y:rest)
    | x`endsWith`"-"   = dehyphenate $ (init x++y):rest
    | otherwise        = x:dehyphenate (y:rest)
dehyphenate xs         = xs

hyphenChunks :: String -> [String]
hyphenChunks s = let
    chunks = hyphenateEnglish s
 in (map (++"-") $ init chunks) ++ [last chunks]
