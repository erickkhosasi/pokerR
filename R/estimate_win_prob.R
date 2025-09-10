library(progress)

# Simulate 100000 trials of same hand to calculate winning probability
estimate_win_prob <- function(hands, community_cards, num_players, trials = 1000) {
  pb <- progress_bar$new(total = trials)
  wins <- 0
  known_cards <- c(hands[[1]], community_cards)
  deck <- create_deck()
  deck <- setdiff(deck, known_cards)
  deal_order <- rep(2:num_players, times = 2) # Set the card dealing order
  
  for (i in 1:trials) {
    temp_deck <- sample(deck) # shuffle the remaining deck
    player_cards <- temp_deck[1:((num_players - 1) * 2)]
    temp_hands <- c(hands[1])
    temp_hands <- c(temp_hands, split(player_cards, deal_order))
    
    evaluations <- get_score(temp_hands, community_cards)
    winner <- get_winner(evaluations)
    
    if (1 %in% winner) {
      wins <- wins + 1
    }
    pb$tick()
  }
  return(wins / trials * 100)
}