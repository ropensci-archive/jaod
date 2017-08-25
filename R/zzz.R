pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

jc <- function(x) Filter(Negate(is.null), x)

# conu8 <- function(x) {
#   httr::content(x, as = "text", encoding = "UTF-8")
# }

doaj_base <- function() "https://doaj.org/api/v1"

jaod_parse <- function(x, parse = TRUE, flatten = TRUE) {
  jsonlite::fromJSON(x, parse, flatten = flatten)
}
