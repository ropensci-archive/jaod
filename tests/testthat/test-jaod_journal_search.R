context("jaod_journal_search")

test_that("jaod_journal_search works", {
  vcr::use_cassette("jaod_journal_search", {
    a <- jaod_journal_search(query = "bibjson.keywords:heritage")
  })

  expect_is(a, "list")
  expect_named(a, c('timestamp', 'page', 'pageSize', 'query', 'total',
                    'next', 'last', 'results'))
  expect_is(a$timestamp, "character")
  expect_type(a$page, "integer")
  expect_type(a$pageSize, "integer")
  expect_is(a$query, "character")
  expect_type(a$total, "integer")
  expect_is(a$`next`, "character")
  expect_is(a$last, "character")
  expect_is(a$results, "data.frame")
})

test_that("jaod_journal_search - params work", {
  vcr::use_cassette("jaod_journal_search_params", {
    # pagination
    a <- jaod_journal_search(query = "bibjson.publisher.name:ecology",
      pageSize = 2)
    # sorting
    b <- jaod_journal_search(query="journal", sort="bibjson.eissn:desc",
                             pageSize = 30)
  })

  expect_equal(NROW(a$results), 2)
  es <- vapply(b$results$bibjson.eissn, 
    function(z) as.numeric(strsplit(z, split="-")[[1]][1]), numeric(1))
  expect_gte(es[1], es[length(es)])
})

test_that("jaod_journal_search fails well", {
  skip_on_cran()

  # missing id
  expect_error(jaod_journal_search(), "argument \"query\" is missing")

  # wrong input types
  expect_error(jaod_journal_search(5), "query must be of class character")
  expect_error(jaod_journal_search("ecology", "adf"),
               "page must be of class integer, numeric")
  expect_error(jaod_journal_search("ecology", pageSize = "adf"),
               "pageSize must be of class integer, numeric")
  expect_error(jaod_journal_search("ecology", sort = 4),
               "sort must be of class character")
})
