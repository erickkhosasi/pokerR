test_that("create_deck returns a vector of 52 unique cards", {
  deck <- create_deck()
  expect_vector(deck, ptype = character())
  expect_length(deck, 52)
  expect_equal(length(unique(deck)), 52)
})