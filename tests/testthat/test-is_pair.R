test_that("is_pair detects one pair", {
  hand <- c("5h", "5d")
  community <- c("2s", "3c", "7h", "9s", "Js")
  res <- is_pair(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "One Pair")
})

test_that("is_pair returns FALSE when no pair exists", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_pair(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})