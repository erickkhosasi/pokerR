test_that("get_score returns list of evaluations for all players", {
  hands <- list(c("Ah", "Kh"), c("2s", "2d"))
  community <- c("Qs", "Jh", "Th", "9h", "8h")
  scores <- get_score(hands, community)
  
  expect_type(scores, "list")
  expect_length(scores, 2)
  expect_true(all(sapply(scores, function(x) "hand_name" %in% names(x))))
})