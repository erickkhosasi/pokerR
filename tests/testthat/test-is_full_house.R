test_that("is_full_house detects full house", {
  hand <- c("2s", "2d")
  community <- c("3s", "3c", "3d", "9h", "Jh")
  res <- is_full_house(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "Full House")
})

test_that("is_full_house returns FALSE when there is no fullhouse", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_full_house(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})