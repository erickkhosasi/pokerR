test_that("is_straight detects straight", {
  hand <- c("4h", "3d")
  community <- c("5s", "2c", "6h", "9s", "Js")
  res <- is_straight(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "Straight")
})

test_that("is_straight returns FALSE when there is no straight", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_straight(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})
