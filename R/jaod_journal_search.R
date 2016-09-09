#' Search for journals
#'
#' @export
#' @param query (character) query terms
#' @param page (integer) Which page of the results you wish to see. Default: 1
#' @param pageSize (integer) How many results per page you wish to see.
#' Default: 10
#' @param sort (character) one of asc or desc, or sort by a specific field,
#' either asc or desc, see examples
#' @template curl
#' @return a tibble (data.frame)
#' @examples \dontrun{
#' out <- jaod_journal_search(query = "bibjson.keywords:heritage")
#' out
#' out$results
#'
#' jaod_journal_search(query = "issn:1544-9173")
#' jaod_journal_search(query = "publisher:dove")
#' }
jaod_journal_search <- function(query, page = 1, pageSize = 10, sort = NULL, ...) {
  res <- jaod_parse(
    jGET(
      file.path(doaj_base(), "search", "journals", query),
      query = jc(list(page = page, pageSize = pageSize)),
      ...
    )
  )
  res$results <- tibble::as_data_frame(res$results)
  nmo <- c('timestamp', 'page', 'pageSize', 'query', 'total',
           'next', 'last', 'results')
  return(res[nmo])
}
