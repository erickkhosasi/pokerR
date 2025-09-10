library(purrr)

# function to remove found from list
rm_found <- function(res) list_modify(res, found = NULL)

# Return evaluation result
return_eval <- function(result) {
  if (result$found) {
    res <- rm_found(result)
    if (is.null(result$rank_score) || is.null(result$high_card)) {
      stop("Missing rank_score or high_card in evaluation")
    }
    return(result)
  }
}

# Evaluate players' hands
evaluate_hand <- function(parsed_cards) {
  # Check for royal flush
  res <- is_royal_flush(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # Check for straight flush
  res <- is_straight_flush(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # Check for Four of a Kind
  res <- is_four_kind(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # Check for Full House
  res <- is_full_house(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # Check for Flush
  res <- is_flush(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # Check for Straight
  res <- is_straight(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # Check for Three of a Kind
  res <- is_three_kind(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # Check for Two Pair
  res <- is_two_pair(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # Check for One Pair
  res <- is_pair(parsed_cards)
  result <- return_eval(res)
  if (!is.null(result)) return(result)

  # High Card (last case)
  high <- parsed_cards |>
    arrange(desc(rank)) |>
    slice_head(n = 5)

  result <- list(
    hand_name = "High Card",
    rank_score = 1,
    high_card = high$rank[1],
    cards = high
  )

  if (is.null(result$rank_score) || is.null(result$high_card)) {
    stop("Missing rank_score or high_card in evaluation")
  }
  return(result)
}