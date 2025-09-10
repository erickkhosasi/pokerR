test_that("is_straight_flush detects straight flush", {
  hand <- c("4s", "5s")
  community <- c("6s", "7s", "8s", "Jh", "Qd")
  res <- is_straight_flush(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "Straight Flush")
})

test_that("is_straight_flush returns FALSE when there is no straight flush", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_straight_flush(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})