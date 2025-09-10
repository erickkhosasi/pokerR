test_that("evaluate_hand returns correct evaluation", {
  hand <- c("2s", "3s")
  community <- c("4s", "5s", "6s", "Kd", "Ac")
  eval <- evaluate_hand(parse_cards(hand, community))
  
  expect_type(eval, "list")
  expect_true(all(c("hand_name", "rank_score", "high_card", "cards") %in% names(eval)))
  expect_gt(eval$rank_score, 0)
})
