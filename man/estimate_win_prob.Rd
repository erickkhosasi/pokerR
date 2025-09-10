\name{estimate_win_prob}
\alias{estimate_win_prob}
\title{Estimate Win Probability in Poker Game}
\description{
Estimates the probability of Player 1 winning given the information of his own cards and community cards.
}
\usage{
estimate_win_prob(hands, community_cards, num_players, trials = 1000)
}
\arguments{
  \item{hands}{A list where each element is a character vector of 2 cards per player.}
  \item{community_cards}{A character vector of 5 community cards.}
  \item{num_players}{A numeric specifying the total number of players in the game.}
  \item{trials}{Number of simulated games for monte carlo simulation (default 1000).}
}
\details{
Perform \code{trials} random simulations with the remaining unknown cards distributed to the other player and calculates the winning percentage for player 1.
}
\value{
A numeric value representing Player 1's winning probability in percentage.
}
\examples{
hands <- list("1" = c("As", "Ks"), "2" = c("2d", "4s"))
community_cards <- c("Qs", "Js", "Ts", "5d", "9c")
win_prob <- estimate_win_prob(hands, community_cards, 2, trials = 1000)
}