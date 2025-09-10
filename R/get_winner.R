get_winner <- function(evaluations) {
  # Determine winner based on rank_score and high_card
  scores <- lapply(evaluations, function(eval) c(eval$rank_score, eval$high_card))
  scores <- do.call(rbind, scores)
  weighted_scores <- scores[, 1] * 100 + scores[, 2]
  winner <- which(weighted_scores == max(weighted_scores))
  return(winner)
}