test_that("is_flush detects flush", {
  hand <- c("2s", "5s")
  community <- c("3s", "6s", "9s", "Ah", "Jc")
  res <- is_flush(parse_cards(hand, community))
  expect_true(res$found)
  expect_equal(res$hand_name, "Flush")
})

test_that("is_flush returns FALSE when there is no flush", {
  hand <- c("2h", "5d")
  community <- c("3s", "7c", "9d", "Jh", "Kc")
  res <- is_flush(parse_cards(hand, community))
  expect_false(res$found)
  expect_null(res$hand_name)
})
