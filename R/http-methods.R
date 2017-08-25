jGET <- function(url, query = NULL, ...) {
  cli <- crul::HttpClient$new(url = url, opts = list(...))
  res <- cli$get(query = query)
  res$raise_for_status()
  res$parse("UTF-8")
}
