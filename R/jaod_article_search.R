#' Search for articles
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
#' out <- jaod_article_search(query = "license:CC-BY")
#' out
#' out$results
#'
#' ## get DOIs or other article IDs
#' names(out$results$bibjson.identifier) <- out$results$id
#' dplyr::bind_rows(out$results$bibjson.identifier, .id = "doaj_id")
#'
#' # more egs
#' jaod_article_search(query = "issn:1544-9173")
#' jaod_article_search(query = "publisher:dove")
#' }
jaod_article_search <- function(query, page = 1, pageSize = 10, sort = NULL, ...) {
  res <- jaod_parse(
    jGET(
      file.path(doaj_base(), "search", "articles", query),
      query = jc(list(page = page, pageSize = pageSize)),
      ...
    )
  )
  res$results <- tibble::as_data_frame(res$results)
  nmo <- c('timestamp', 'page', 'pageSize', 'query', 'total',
           'next', 'last', 'results')
  return(res[nmo])
}
