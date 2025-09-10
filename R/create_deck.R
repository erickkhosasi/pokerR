# Create and shuffle 52-cards poker deck
create_deck <- function(shuffle = FALSE) {
  suits <- c("s", "h", "d", "c")
  ranks <- c("A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K")
  deck <- expand.grid(rank = ranks, suit = suits)
  deck <- paste0(deck$rank, deck$suit) # Create a deck with character vector of 52 cards
  if (shuffle == TRUE) sample(deck)
  return(deck)
}
