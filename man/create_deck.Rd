\name{create_deck}
\alias{create_deck}
\title{Create a Standard 52-Card Deck}
\description{
Generates a standard 52-card poker deck represented as a character strings.
}
\usage{
create_deck()
}
\arguments{
  \item{shuffle}{A boolean to specify whether the deck will be shuffled or not.}
}
\details{
Each card is represented by two characters: the first for the rank (e.g., "2", "T", "Q", "A") and the second for the suit (e.g., "s", "h", "d", "c").
}
\value{
A character vector of 52 unique card strings.
}
\examples{
deck <- create_deck()
sample(deck) # shuffle the deck
}