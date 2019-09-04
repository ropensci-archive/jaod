context("jaod_article")

test_that("jaod_article works", {
  vcr::use_cassette("jaod_article", {
    a <- jaod_article(id = "0005e11ec616453f854070069385e057")

    expect_is(a, "list")
    expect_named(a, c('admin', 'last_updated', 'id', 'bibjson', 'created_date'))
    expect_is(a$admin, "list")
    expect_is(a$last_updated, "character")
    expect_is(a$id, "character")
    expect_is(a$bibjson, "list")
    expect_is(a$bibjson$title, "character")
    expect_is(a$created_date, "character")
  })
})

test_that("jaod_article many inputs", {
  vcr::use_cassette("jaod_article_many_inputs", {
    ids <- c("73f781ad57094b98a0b46d8903fdc2c2",
      "0005e11ec616453f854070069385e057")
    d <- lapply(ids, jaod_article)

    expect_is(d, "list")
    expect_is(d[[1]], "list")
    expect_is(d[[2]], "list")
    expect_equal(length(d), 2)
  })
})

test_that("jaod_article fails well", {
  skip_on_cran()

  # missing id
  expect_error(jaod_article(), "argument \"id\" is missing")

  # not found
  expect_error(jaod_article("asdf"), "HTTP 404", class = "error")

  # wrong type
  expect_error(jaod_article(5), "id must be of class character")
})
