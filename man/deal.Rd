\name{deal}
\alias{deal}
\title{Deal Hands and Community Cards from a Deck}
\description{
Randomly deals cards to each player and the community from a given deck.
}
\usage{
deal(deck, num_players)
}
\arguments{
  \item{deck}{A character vector of the deck to deal (typically shuffled).}
  \item{num_players}{An integer specifying how many players are in the game.}
}
\value{
A list with two elements:
\itemize{
  \item{\code{hands}}: A list where each element is a character vector 2 cards per player.
  \item{\code{community}}: A character vector of 5 community cards.
}
}
\examples{
deck <- sample(create_deck())
deal(deck, 3) # dealing cards to 3 players
}