# Calculate each players' hands score and decide winner
get_score <- function(hands, community_cards) {
  # Evaluate each player's hand
  evaluations <- lapply(hands, function(hand) {
    parsed_cards <- parse_cards(hand, community_cards)
    evaluate_hand(parsed_cards)
  })
  
  for (i in seq_along(evaluations)) {
    eval <- evaluations[[i]]
    if (is.null(eval$rank_score) || is.null(eval$high_card)) {
      cat("Broken eval at index", i, "\n")
      print(eval)
      stop("Evaluation failed")
    }
  }
  
  return(evaluations)
}
