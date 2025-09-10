test_that("is_royal_flush detects royal flush", {
  hand <- c("Ts", "Js")
  community <- c("Qs", "Ks", "As", "Jh", "Qd")
  res <- is_royal_flush(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "Royal Flush")
})

test_that("is_royal_flush returns FALSE when there is no royal flush", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_royal_flush(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})