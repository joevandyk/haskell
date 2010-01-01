-- A translation of http://en.wikipedia.org/wiki/Binary_search_algorithm#Recursive
binary_find :: Ord a => [a] -> a -> Maybe Int
binary_find [] elem   = Nothing

binary_find list elem = 
  do_search list elem 0 (length list - 1) 
  where
    do_search list elem low high = 
      if high < low then Nothing
      else 
        if list !! mid > elem
        then do_search list elem low (mid - 1)
        else
          if list !! mid < elem
          then do_search list elem (mid + 1) high 
          else Just mid
      where
        mid = low + (high - low) `div` 2

main = do
  print $ binary_find [1] 1
  print $ binary_find [1,3] 1
  print $ binary_find [1,3,4] 3
  print $ binary_find [1,3,4] 4
  print $ binary_find [1,2,4,6,8,9,12,15,17,20] 17
  print $ binary_find "hello" 'l'
  print $ binary_find [0.0, 1.5, 3.0] 3.0

  print $ binary_find [] 1
  print $ binary_find [1,3] 2
  print $ binary_find [1,4,6,8,9,12,15,17,20] 2

  -- boom?
  print $ binary_find [1,4,6,8,9,12,15,17,20] 100
