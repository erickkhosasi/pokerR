# Deal cards from deck to players and community
deal <- function(deck, num_players = 2) {
  # Define the list of cards for players and community
  player_cards <- deck[1:(num_players * 2)] # The first num_players * 2 cards because each player will get 2 cards
  community_cards <- deck[(num_players * 2 + 1):(num_players * 2 + 5)] # The leftover 5 cards after player cards

  # Define the player dealing order (deal two rotations)
  deal_order <- rep(1:num_players, times = 2)

  # Deal the cards to players according to the deal_order
  hands <- split(player_cards, deal_order)

  # return the playing hands
  return(list(
    hands = hands,
    community = community_cards
  ))
}
