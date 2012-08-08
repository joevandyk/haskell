module Code where

myNot True  = False
myNot False = True

myAnd True True = True
myAnd _ _ = False

myOr True _ = True
myOr _ True = True
myOr _ _    = False

threeDifferent :: Integer -> Integer -> Integer -> Bool
threeDifferent x y z = x /= y && y /= z && x /= z

-- 3.14
min' :: Int -> Int -> Int
min' a b  
  | a < b = a
  | otherwise = b

minThree' :: Int -> Int -> Int -> Int
minThree' a b c = min' a $ min' b c


-- 3.16
offset = fromEnum 'Z' - fromEnum 'z'
toUpper ch = toEnum (fromEnum ch + offset)
isLowerChar ch = fromEnum ch >= fromEnum 'a' && fromEnum ch <= fromEnum 'z'

convertToUpper :: Char -> Char
convertToUpper c | isLowerChar c = toUpper c 
                 | otherwise = c
