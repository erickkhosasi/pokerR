test_that("get_winner returns index of the winner", {
  hands <- list(c("Ah", "Kh"), c("2s", "2d"))
  community <- c("Qs", "Jh", "Th", "9h", "8h")
  scores <- get_score(hands, community)
  winner <- get_winner(scores)
  
  expect_type(winner, "integer")
  expect_true(winner == 1)
})