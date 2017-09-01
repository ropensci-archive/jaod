#' Get a journal by ID
#'
#' @export
#' @param id (character) a DOAJ journal ID, a UUID. Note, this
#' is not an ISSN, but you can use [jaod_journal_search()] to
#' search by ISSN to get the DOAJ id
#' @template curl
#' @return a named list, with slots admin, last_updated, id, created_date,
#' and bibjson
#' @examples \dontrun{
#' out <- jaod_journal(id = "f3f2e7f23d444370ae5f5199f85bc100")
#' out$admin
#' out$last_updated
#' out$id
#' out$created_date
#' out$bibjson
#'
#' ids <- c("f3f2e7f23d444370ae5f5199f85bc100",
#' "9abfb36b06404e8a8566e1a44180bbdc")
#' out <- lapply(ids, jaod_journal)
#' out[[1]]
#' }
jaod_journal <- function(id, ...) {
  assert(id, "character")
  jaod_parse(
    jGET(
      file.path(doaj_base(), "journals", id),
      ...
    )
  )
}
