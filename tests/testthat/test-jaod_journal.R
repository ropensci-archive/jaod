context("jaod_journal")

test_that("jaod_journal works", {
  vcr::use_cassette("jaod_journal", {
    a <- jaod_journal(id = "f3f2e7f23d444370ae5f5199f85bc100")
  })

  expect_is(a, "list")
  expect_true("id" %in% names(a))
  expect_is(a$admin, "list")
  expect_is(a$last_updated, "character")
  expect_is(a$id, "character")
  expect_is(a$bibjson, "list")
  expect_is(a$bibjson$title, "character")
  expect_is(a$created_date, "character")
})

test_that("jaod_journal many inputs", {
  vcr::use_cassette("jaod_journal_many_inputs", {
    ids <- c("f3f2e7f23d444370ae5f5199f85bc100",
             "9abfb36b06404e8a8566e1a44180bbdc")
    d <- lapply(ids, jaod_journal)
  })

  expect_is(d, "list")
  expect_is(d[[1]], "list")
  expect_is(d[[2]], "list")
  expect_equal(length(d), 2)
})

test_that("jaod_journal fails well", {
  skip_on_cran()

  # missing id
  expect_error(jaod_journal(), "argument \"id\" is missing")

  # not found
  expect_error(jaod_journal("asdf"), "HTTP 404", class = "error")

  # wrong type
  expect_error(jaod_journal(5), "id must be of class character")
})
