import Data.Ord (comparing)

data Suit = Hearts | Spades | Clubs | Diamonds
  deriving (Show, Eq, Enum, Bounded)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
  deriving (Show, Eq, Enum, Ord, Bounded)

data Card = Card { rank :: Rank, suit :: Suit }

instance Show Card where
  show (Card rank suit) = show rank ++ " of " ++ show suit

-- Cards should be compared by looking at the rank
instance Ord Card where compare = comparing rank
--instance Eq Card where (==) (Card rank _) (Card rank1 _) = rank == rank1

data Deck = Deck [Card] deriving (Show)
data Hand = Hand [Card] deriving (Show)

-- Returns a new deck
newDeck :: Deck
newDeck = Deck [ Card r s | r <- [minBound..maxBound], s <- [minBound..maxBound] ]

puts = putStrLn

main = do
  puts $ show $ Card Ace Hearts > Card Three Spades
  puts $ show $ Card Ace Spades > Card Ace Hearts
  puts $ show $ Card Two Hearts == Card Two Spades
  puts $ show $ newDeck
  puts "done"
  
  -- Tasks: 
  --   1. Be able to create and shuffle decks
  --   2. Be able to deal hands from a deck
  --   3. Given hands, be able to see which hand wins.
