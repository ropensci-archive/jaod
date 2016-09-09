jGET <- function(url, ...) {
  res <- httr::GET(url, ...)
  httr::stop_for_status(res)
  conu8(res)
}
