# Check player's hand
library(tidyverse)

# Create rank map to assign value to card rank
rank_map <- setNames(c(14, 2:13), c("A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"))

parse_cards <- function(hand_cards, community_cards) {
  cards <- c(hand_cards, community_cards)

  # Separate and clean the cards rank & suit
  rank <- substr(cards, 1, 1)
  suit <- substr(cards, 2, 2)

  # Assign rank value
  rank <- unname(rank_map[rank])

  # Create a data.frame from rank & suit
  parsed_cards <- data.frame(rank = rank, suit = suit)
  return(parsed_cards)
}

#################################################################
# Detect 1 pair of cards (2 cards of same rank)
is_pair <- function(parsed_cards) {
  # Get the count of each rank
  pair_rank <- parsed_cards |>
    count(rank) |>
    filter(n == 2) |>
    pull(rank)

  if (length(pair_rank) != 1) {
    return(list(found = FALSE))
  }

  pair_cards <- parsed_cards |>
    filter(rank == pair_rank[1])

  kicker_cards <- parsed_cards |>
    filter(rank != pair_rank[1]) |>
    arrange(desc(rank), desc(suit)) |>
    slice_head(n = 3)

  return(list(
    found = TRUE,
    hand_name = "One Pair",
    rank_score = 2,
    high_card = pair_rank[1],
    cards = bind_rows(pair_cards, kicker_cards)
  ))
}

#################################################################
# Detect 2 distinct pairs of cards
is_two_pair <- function(parsed_cards) {
  # Get the count of each rank
  pair_rank <- parsed_cards |>
    count(rank) |>
    filter(n == 2) |>
    arrange(desc(rank)) |>
    slice_head(n = 2) |>
    pull(rank)

  if (length(pair_rank) < 2) {
    return(list(found = FALSE))
  }

  pair_cards <- parsed_cards |>
    filter(rank %in% pair_rank) |>
    arrange(desc(rank))

  kicker_cards <- parsed_cards |>
    filter(!rank %in% pair_rank) |>
    arrange(desc(rank), desc(suit)) |>
    slice_head(n = 1)

  return(list(
    found = TRUE,
    hand_name = "Two Pair",
    rank_score = 3,
    high_card = pair_rank[1],
    cards = bind_rows(pair_cards, kicker_cards)
  ))
}

#################################################################
# Detect 3 cards of the same rank
is_three_kind <- function(parsed_cards) {
  # Get the count of each rank
  three_rank <- parsed_cards |>
    count(rank) |>
    filter(n == 3) |>
    arrange(desc(rank)) |>
    slice_head(n = 1) |>
    pull(rank)

  if (length(three_rank) == 0) {
    return(list(found = FALSE))
  }

  three_cards <- parsed_cards |>
    filter(rank == three_rank[1])

  kicker_cards <- parsed_cards |>
    filter(rank != three_rank[1]) |>
    arrange(desc(rank), desc(suit)) |>
    slice_head(n = 2)

  return(list(
    found = TRUE,
    hand_name = "Three of a Kind",
    rank_score = 4,
    high_card = three_rank[1],
    cards = bind_rows(three_cards, kicker_cards)
  ))
}

#################################################################
# Detect 5 sequential unique ranks
is_straight <- function(parsed_cards) {
  # Get the unique sorted ranks (descending)
  ranks <- sort(unique(parsed_cards$rank), decreasing = TRUE)

  # Assign A value as both 14 and 1
  if (14 %in% ranks) {
    ranks <- c(ranks, 1)
  }

  # Look for any 5-card descending sequence
  for (i in seq_along(ranks)) {
    if (i + 4 <= length(ranks)) {         # Check whether there's 5 cards left
      sequence <- ranks[i:(i + 4)]        # Get the 5-cards sequence
      if (all(diff(sequence) == -1)) {    # Check if the sequences are straight (1-difference steps)
        # Get full card tibble (rank + suit)
        straight_cards <- parsed_cards |>
          filter(rank %in% sequence) |>
          arrange(desc(rank)) |>
          distinct(rank, .keep_all = TRUE) |>
          slice_head(n = 5)

        return(list(
          found = TRUE,
          hand_name = "Straight",
          rank_score = 5,
          high_card = sequence[1],
          cards = straight_cards
        ))
      }
    }
  }

  # If no straight cards found
  return(list(found = FALSE))
}

#################################################################
# Detect 5 cards of the same suit
is_flush <- function(parsed_cards) {
  flush_suit <- parsed_cards |>
    count(suit) |>
    filter(n >= 5) |>
    pull(suit)

  if (length(flush_suit) == 0) {
    return(list(found = FALSE))
  }

  flush_cards <- parsed_cards |>
    filter(suit == flush_suit[1]) |>
    arrange(desc(rank)) |>
    slice_head(n = 5)

  return(list(
    found = TRUE,
    hand_name = "Flush",
    rank_score = 6,
    high_card = flush_cards[1, 1],
    cards = flush_cards
  ))
}

#################################################################
# Detect full house (3 of one rank and 2 of another rank)
is_full_house <- function(parsed_cards) {
  rank_counts <- parsed_cards |>
    count(rank)

  three <- rank_counts |>
    filter(n == 3) |>
    pull(rank)

  pair <- rank_counts |>
    filter(n == 2) |>
    slice_max(order_by = rank)

  if (length(three) == 0 || length(pair) == 0) {
    return (list(found = FALSE))
  } else {
    fullhouse_cards <- parsed_cards |>
      filter(rank %in% c(three, pair)) |>
      arrange(desc(rank))

    return(list(
      found = TRUE,
      hand_name = "Full House",
      rank_score = 7,
      high_card = three[1],
      cards = fullhouse_cards
    ))
  }
}

#################################################################
# Detect 4 cards of the same rank
is_four_kind <- function(parsed_cards) {
  # Get the count of each rank
  four_rank <- parsed_cards |>
    count(rank) |>
    filter(n == 4) |>
    pull(rank)

  if (length(four_rank) == 0) {
    return(list(found = FALSE))
  }

  four_cards <- parsed_cards |>
    filter(rank == four_rank[1])

  kicker_card <- parsed_cards |>
    filter(rank != four_rank[1]) |>
    arrange(desc(rank), desc(suit)) |>
    slice_head(n = 1)

  return(list(
    found = TRUE,
    hand_name = "Four of a Kind",
    rank_score = 8,
    high_card = four_rank[1],
    cards = bind_rows(four_cards, kicker_card)
  ))
}

#################################################################
# Detect 5 sequential unique ranks with the same suit
is_straight_flush <- function(parsed_cards) {
  flush_suit <- parsed_cards |>
    count(suit) |>
    filter(n >= 5) |>
    pull(suit)

  if (length(flush_suit) == 0) {
    return(list(found = FALSE))
  }

  flush_cards <- parsed_cards |>
    filter(suit == flush_suit[1])

  res_straight <- is_straight(flush_cards)
  if (res_straight$found) {
    return(list(
      found = TRUE,
      hand_name = "Straight Flush",
      rank_score = 9,
      high_card = res_straight$high_card,
      cards = res_straight$cards
    ))
  } else {
    return(list(found = FALSE))
  }
}

#################################################################
# Detect a royal flush hands
is_royal_flush <- function(parsed_cards) {
  res_rf <- is_straight_flush(parsed_cards)
  if(res_rf$found && res_rf$high_card == 14) {
    return(list(
      found = TRUE,
      hand_name = "Royal Flush",
      rank_score = 10,
      high_card = res_rf$high_card,
      cards = res_rf$cards
    ))
  } else {
    return(list(found = FALSE))
  }
}