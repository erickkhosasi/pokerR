test_that("parse_cards returns 7-row dataframe with rank and suit", {
  hand <- c("Ah", "Kd")
  community <- c("2s", "3s", "4s", "5s", "6s")
  
  parsed <- parse_cards(hand, community)
  
  expect_s3_class(parsed, "data.frame")
  expect_equal(nrow(parsed), 7)
  expect_named(parsed, c("rank", "suit"))
  expect_type(parsed$rank, "double")
  expect_type(parsed$suit, "character")
  expect_true(all(nchar(parsed$suit) == 1))
})
