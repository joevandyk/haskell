-- A translation of http://en.wikipedia.org/wiki/Binary_search_algorithm#Recursive
binary_find list elem = 
  do_search list elem 0 (length list - 1) 
  where
    do_search low high
      | high    < low   = Nothing
      | mid_val > elem  = do_search low     (mid-1)
      | mid_val < elem  = do_search (mid+1) high
      | otherwise       = Just mid
      where
        mid     = low + (high - low) `div` 2
        mid_val = list !! mid

main = do
  print $ binary_find [1] 1
  print $ binary_find [1,3] 1
  print $ binary_find [1,3,4] 3
  print $ binary_find [1,3,4] 4
  print $ binary_find [1,2,4,6,8,9,12,15,17,20] 17
  print $ binary_find [1,2,4,6,8,9,12,15,17,20] 20
  print $ binary_find "hello" 'l'
  print $ binary_find [0.0, 1.5, 3.0] 3.0

  print $ binary_find [] 1
  print $ binary_find [1,3] 2
  print $ binary_find [1,4,6,8,9,12,15,17,20] 2
  print $ binary_find [1,4,6,8,9,12,15,17,20] 100
  print $ binary_find [1,4,6,8,9,12,15,17,20] (-100)
