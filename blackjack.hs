{-# LANGUAGE TemplateHaskell #-}

import Data.Ord (comparing)
import Test.QuickCheck.All
import Control.Monad
import Test.QuickCheck
import Test.QuickCheck.Gen
import System.Random

data Suit = Hearts | Spades | Clubs | Diamonds
  deriving (Show, Eq, Enum, Bounded)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
  deriving (Show, Eq, Enum, Ord, Bounded)

data Card = Card { rank :: Rank, suit :: Suit }

instance Show Card where
  show (Card rank suit) = show rank ++ " of " ++ show suit

-- Cards should be compared by looking at the rank
instance Ord Card where compare = comparing rank
instance Eq Card where (==) (Card rank _) (Card rank1 _) = rank == rank1

type Deck = [Card] -- Should these be an actual type?
type Hand = [Card]

-- TODO fix Aces and duplication
-- Probably should use fold or something here.
scoreHand :: Hand -> Int
scoreHand hand = sum $ map (score) hand
  where 
    score card = case rank card of 
                  Jack  -> 10
                  Queen -> 10
                  King  -> 10
                  Ace   -> 11
                  otherwise -> 2 + (fromEnum $ rank card)

-- Should I be returning a Bool here? Or a fancier type?
bustedHand :: Hand -> Bool
bustedHand hand = scoreHand hand > 21

-- Not right, I know?
blackJack :: Hand -> Bool
blackJack hand = scoreHand hand == 21

-- Returns a new deck
newDeck :: Deck
newDeck = [ Card r s | r <- [minBound..maxBound], s <- [minBound..maxBound] ]

main = $(quickCheckAll)

-- Tasks: 
--   1. Be able to create and shuffle decks
--   2. Be able to deal hands from a deck
--   3. Given hands, be able to see which hand wins.
--   More
--

prop_deckLength = length newDeck == 52
prop_bustedHand1 = bustedHand [Card Two Hearts] == False
prop_bustedHand2 = bustedHand [Card Two Hearts, Card King Spades, Card King Spades] == True
prop_scoreHand1 = scoreHand [Card Two Hearts] == 2
prop_scoreHand2 = scoreHand [Card Ace Hearts] == 11
prop_scoreHand3 = scoreHand [Card King Hearts] == 10
prop_scoreHand4 = scoreHand [Card Jack Clubs] == 10
prop_scoreHand5 = scoreHand [Card Queen Clubs, Card Three Hearts] == 13
prop_blackjack = blackJack [Card Jack Clubs, Card Ace Hearts] == True

{-
-- Trying to figure out how to generate random cards for a hand
instance Arbitrary Card where
  arbitrary = do 
    number <- choose [minBound..maxBound]::Rank
    rank <- (toEnum number)::Rank
    return $ Card rank Hearts

prop_busted_not_blackjack hand = blackJack hand /= bustedHand hand
-}
