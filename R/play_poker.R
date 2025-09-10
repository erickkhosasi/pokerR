play_poker <- function(num_players = 2) {
  deck <- create_deck(shuffle = TRUE)
  playing_cards <- deal(deck, num_players)

  hands <- playing_cards$hands
  community_cards <- playing_cards$community

  # Show your hand cards (hand$`1`) to decide whether to play
  cat(paste("\nYour playing hands: ", paste(hands$`1`, collapse = ", ")), "\n")
  cat(paste("Community cards: ", paste(community_cards, collapse = ", ")), "\n\n")
  cat("Calculating winning probability by monte carlo simulation...\n")
  win_prob <- estimate_win_prob(hands, community_cards, num_players)
  cat("Your probability of winning is", win_prob, "%\n")

  # Prompt user whether to continue play/call bet
  loop <- TRUE
  while (loop) {
    user_choice <- tolower(readline("Continue to play (y/n): "))

    # Validate user input
    if (!user_choice %in% c("y", "n")) {
      cat("Invalid input. Please enter y/n\n")
      next
    }

    # Decide to continue the game or fold
    if(user_choice == "y") {
      break
    } else {
      cat("You fold. Try again next time\n")
      break
    }
  }

  cat("\nShowing players' hands:\n")
  for (i in 1:num_players) {
    cat("Player", i, ":", paste(hands[[i]], collapse = ", "), "\n")
  }

  # Evaluate each player's hand
  evaluations <- get_score(hands, community_cards)

  # Determine winner based on the evaluation
  winner <- get_winner(evaluations)

  # Announce the winner and their hands
  cat("\nWinner(s): Player ", paste(winner, collapse = ", ", "\n"))

  for (i in winner) {
    cat("Player", i, "-", evaluations[[i]]$hand_name, "\n\n")
    print(evaluations[[i]]$cards)
  }
}