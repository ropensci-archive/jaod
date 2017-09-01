context("jaod_article_search")

test_that("jaod_article_search works", {
  skip_on_cran()

  a <- jaod_article_search(query = "license:CC-BY")

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

test_that("jaod_article_search - params work", {
  skip_on_cran()

  # pagination
  a <- jaod_article_search(query = "license:CC-BY", pageSize = 2)
  expect_equal(NROW(a$results), 2)

  # sorting
  a <- jaod_article_search(query="Pinus contorta", sort="year:desc",
    pageSize = 30)
  yrs <- as.numeric(a$results$bibjson.year)
  expect_gt(yrs[1], yrs[length(yrs)])
})

test_that("jaod_article_search fails well", {
  skip_on_cran()

  # missing id
  expect_error(jaod_article_search(), "argument \"query\" is missing")

  # wrong input types
  expect_error(jaod_article_search(5), "query must be of class character")
  expect_error(jaod_article_search("ecology", "adf"),
               "page must be of class integer, numeric")
  expect_error(jaod_article_search("ecology", pageSize = "adf"),
               "pageSize must be of class integer, numeric")
  expect_error(jaod_article_search("ecology", sort = 4),
               "sort must be of class character")
})
