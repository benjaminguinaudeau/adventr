test_that("multiplication works", {
  expect_silent(read_advent_of_code(day = 1))
  expect_error(read_advent_of_code(day = 32),
               "Please don't repeatedly request this endpoint before it unlocks! The calendar countdown is synchronized with the server time; the link will be enabled on the calendar the instant this puzzle becomes available.")
  expect_error(read_advent_of_code(day = 1, cookie = ""))
  expect_error(read_advent_of_code(day = 1, cookie = "dd"), "Request was blocked, your cookie seems to be wrong.")
})

