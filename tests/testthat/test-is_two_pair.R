test_that("is_two_pair detects two pair", {
  hand <- c("5h", "5d")
  community <- c("2s", "2c", "7h", "9s", "Js")
  res <- is_two_pair(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "Two Pair")
})

test_that("is_two_pair returns FALSE when less than two pairs exist", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_two_pair(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})
