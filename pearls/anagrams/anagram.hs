import qualified Data.Map as Map
import Data.Ord
import Data.List
import qualified Data.ByteString.Char8 as BS

-- what's the type here?  I get an infinite type error
anagrams :: Ord a => [a] -> [a]
anagrams words = 
  sorted_anagrams
  where  
    sorted_anagrams      = sortBy (flip $ comparing length) get_anagrams
    get_anagrams         = Map.elems $ foldl' insert_word Map.empty words
    insert_word map word = Map.insertWith' (++) (sort word) [word] map

main = do
  -- original code, worked fine:
  -- input <- getContents
  -- print $ take 3 $ anagrams $ lines input
  -- new code with bytestring has errors
  input <- BS.getContents
  print $ take 3 $ anagrams $ BS.lines input
