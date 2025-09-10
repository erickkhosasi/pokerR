test_that("is_four_kind detects four of a kind", {
  hand <- c("2s", "2d")
  community <- c("2h", "2c", "3d", "9c", "Jh")
  res <- is_four_kind(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "Four of a Kind")
})

test_that("is_four_kind returns FALSE when there is no four of a kind", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_four_kind(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})