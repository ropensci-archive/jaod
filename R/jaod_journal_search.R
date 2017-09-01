#' Search for journals
#'
#' @export
#' @inheritParams jaod_article_search
#' @return a list with metadata (`timestamp`, `page`, `pageSize`, `query`,
#' `total` (number of results), `next` and `last` (next page and last page),
#' and `results` (a tibble (data.frame)))
#' @section query:
#' You can search inside any field you see in the results or the schema.
#' See <https://doaj.org/api/v1/docs#specific_field_search> for more details.
#' For example, to search for all articles with abstracts containing the
#' word "shadow", you would do `bibjson.abstract:"shadow"`.
#'
#' Short-hand names are available for some fields. See
#' <https://doaj.org/api/v1/docs#short_field_names> for more details. For
#' example: `doi:10.3389/fpsyg.2013.00479`, `issn:1874-9496`, `license:CC-BY`,
#' and `title:hydrostatic pressure`
#' @examples \dontrun{
#' out <- jaod_journal_search(query = "bibjson.keywords:heritage")
#' out
#' out$results
#'
#' jaod_journal_search(query = "issn:1544-9173")
#' jaod_journal_search(query = "publisher:dove")
#'
#' # sorting
#' out <- jaod_journal_search(query = "bibjson.keywords:heritage",
#'   sort = "bibjson.oa_start.year:desc")
#' out$results$bibjson.oa_start.year
#' }
jaod_journal_search <- function(query, page = 1, pageSize = 10, sort = NULL,
                                ...) {

  assert(query, "character")
  assert(page, c('integer', 'numeric'))
  assert(pageSize, c('integer', 'numeric'))
  assert(sort, "character")
  res <- jaod_parse(
    jGET(
      file.path(doaj_base(), "search", "journals", query),
      query = jc(list(page = page, pageSize = pageSize, sort = sort)),
      ...
    )
  )
  res$results <- tibble::as_data_frame(res$results)
  nmo <- c('timestamp', 'page', 'pageSize', 'query', 'total',
           'next', 'last', 'results')
  return(res[nmo])
}
