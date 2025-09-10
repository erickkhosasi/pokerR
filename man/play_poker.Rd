\name{play_poker}
\alias{play_poker}
\title{Play a Game of Poker with R}
\description{
Play a simplified Texas Hold'em poker game in the console with multiple npc.
Includes the ability to simulate and calculate winning probabilities using a Monte Carlo simulation.
}
\usage{
play_poker(num_players = 2)
}
\arguments{
  \item{num_players}{an integer specifying the number of players playing the poker game (minimum 2).}
}
\details{
The game simulates a poker round with random card distribution, community cards, and hand evaluation for each player. It prints the hand, community cards, and determines the winner(s) based on the best poker hand logic. Optionally, the player can estimate their win probability via simulation.
}
\value{
This function does not return any value. It is run for side effects: it prints interactive game information and the result to the console.
}
\examples{
# Run a 2-player poker game
play_poker()

# Run a 5-player poker game
play_poker(5)
}