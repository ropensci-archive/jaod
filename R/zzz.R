pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

jc <- function(x) Filter(Negate(is.null), x)

doaj_base <- function() "https://doaj.org/api/v2"

jaod_parse <- function(x, parse = TRUE, flatten = TRUE) {
  jsonlite::fromJSON(x, parse, flatten = flatten)
}

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x)[1] %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
