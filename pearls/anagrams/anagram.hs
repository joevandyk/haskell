import qualified Data.Map as Map
import Data.Ord
import Data.List

anagrams words = 
  sorted_anagrams
  where  
    sorted_anagrams      = sortBy (flip $ comparing length) get_anagrams
    get_anagrams         = Map.elems $ foldl' insert_word Map.empty words
    insert_word map word = Map.insertWith' (++) (sort word) [word] map

main = do
  input <- getContents
  print $ take 3 $ anagrams $ lines input
