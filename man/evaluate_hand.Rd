\name{evaluate_hand}
\alias{evaluate_hand}
\title{Evaluate the Best Poker Hand}
\description{
Evaluates the best 5-cards poker hand from 7 available cards (2 hand cards & 5 community cards).
}
\usage{
evaluate_hand(parsed_cards)
}
\arguments{
  \item{parsed_cards}{A data frame with columns \code{rank} and \code{suit}, typically returned from \code{parsed_cards()}.}
}
\details{
This function checks for all poker hands in descending strength, from Royal Flush to High Card, and return the highest match.
}
\value{
A list containing:
\itemize{
  \item{\code{hand_name}}: Name of the best hand (e.g., "Straight")
  \item{\code{rank_score}}: Numeric score for ranking hands (1 - 10)
  \item{\code{high_card}}: Rank of the top card in the hand.
  \item{\code{cards}}: A data frame of the best 5 cards forming the hand.
}
}
\examples{
player_hand <- c("As", "Ks")
community_cards <-c("Qs", "Js", "Ts", "5d", "9c")
cards <- parse_cards(player_hand, community_cards)
evaluate_hand(cards)
}