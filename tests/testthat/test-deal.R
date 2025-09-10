test_that("deal returns correct structure for hands and community", {
  deck <- create_deck()
  dealt <- deal(deck, num_players = 2)
  
  expect_type(dealt, "list")
  expect_named(dealt, c("hands", "community"))
  
  expect_length(dealt$hands, 2)
  expect_length(dealt$hands[[1]], 2)
  expect_length(dealt$hands[[2]], 2)
  expect_length(dealt$community, 5)
})