import qualified Data.Map as Map
import Data.Ord
import Data.List
import qualified Data.ByteString.Char8 as BS

anagrams :: [BS.ByteString] -> [[BS.ByteString]]
anagrams words = 
  sorted_anagrams
  where  
    sorted_anagrams      = sortBy (flip $ comparing length) get_anagrams
    get_anagrams         = Map.elems $ foldl' insert_word Map.empty words
    insert_word map word = Map.insertWith' (++) sorted_word [word] map
    sorted_word word     = BS.pack . sort . BS.unpack $ word

main = do
  input <- BS.getContents
  print $ take 3 $ anagrams $ BS.lines input
