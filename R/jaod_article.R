#' Get an article by ID
#'
#' @export
#' @param id (character) a DOAJ article ID, a UUID. Note, this
#' is not a DOI, but you can use \code{\link{jaod_article_search}} to
#' search by ISSN to get DOAJ article ids
#' @template curl
#' @return a named list, with slots admin, last_updated, id, created_date,
#' and bibjson
#' @examples \dontrun{
#' out <- jaod_article(id = "0004c9e6a3c64ec9848607e51b7edbca")
#' out$admin
#' out$last_updated
#' out$id
#' out$created_date
#' out$bibjson
#'
#' ids <- c("0004c9e6a3c64ec9848607e51b7edbca",
#' "0005e11ec616453f854070069385e057")
#' out <- lapply(ids, jaod_article)
#' out[[1]]
#' }
jaod_article <- function(id, ...) {
  jaod_parse(
    jGET(
      file.path(doaj_base(), "articles", id),
      ...
    )
  )
}