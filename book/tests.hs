{-# LANGUAGE TemplateHaskell #-}
import Test.QuickCheck.All

import Code

prop_myNot x   = not x == myNot x

prop_myAnd x y = (x && y) == (x `myAnd` y)
prop_myOr  x y = (x || y) == (x `myOr`  y)

prop_mymin1 a b = a >= min' a b && b >= min' a b

prop_mymin_three a b c = 
  a >= minThree' a b c && 
  b >= minThree' a b c && 
  c >= minThree' a b c 

prop_converToUpper1 = convertToUpper 'a' == 'A'
prop_converToUpper2 = convertToUpper 'B' == 'B'
prop_converToUpper3 = convertToUpper 'c' == 'C'
prop_converToUpper4 = convertToUpper '?' == '?'
-- prop_converToUpper5 :: Char -> Char
-- prop_converToUpper5 c = if isLowerChar c then c else convertToUpper c

main = do 
  $(quickCheckAll)
