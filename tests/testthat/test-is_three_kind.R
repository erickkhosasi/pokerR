test_that("is_three_kind detects three of a kind", {
  hand <- c("5h", "5d")
  community <- c("5s", "2c", "7h", "9s", "Js")
  res <- is_three_kind(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "Three of a Kind")
})

test_that("is_three_kind returns FALSE when cards are not three of a kind", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_three_kind(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})