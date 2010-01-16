-- insert randomly generated numbers into a set 
-- insert one-by-one 
-- the set must not contain duplicates 
-- after a insertion return a sorted set, with the requested size, after the last insertion


main = do
  print $ insert_numbers 10

insert_numbers how_many = 
  foldl inserter numbers_to_insert
  where
    numbers_to_insert = [10, 10, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] -- TODO make random
    inserter number list =  ... ugh
      

