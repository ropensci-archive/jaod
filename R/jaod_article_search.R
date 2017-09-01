#' Search for articles
#'
#' @export
#' @param query (character) query terms. See Details.
#' @param page (integer) Which page of the results you wish to see. Default: 1
#' @param pageSize (integer) How many results per page you wish to see.
#' Default: 10
#' @param sort (character) one of asc or desc, or sort by a specific field,
#' either asc or desc, see examples. If asc or desc not given, asc is used
#' @template curl
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
#' out <- jaod_article_search(query = "license:CC-BY")
#' out
#' out$results
#'
#' ## get DOIs or other article IDs
#' names(out$results$bibjson.identifier) <- out$results$id
#' do.call(rbind, out$results$bibjson.identifier)
#'
#' # more egs
#' jaod_article_search(query = "issn:1544-9173")
#' jaod_article_search(query = "publisher:dove")
#'
#' # sorting
#' res <- jaod_article_search(query="Pinus contorta", sort="year:desc",
#'   pageSize = 50)
#' res$results$bibjson.year
#' jaod_article_search(query="green", sort="bibjson.year:desc")
#' }
jaod_article_search <- function(query, page = 1, pageSize = 10, sort = NULL,
                                ...) {

  assert(query, "character")
  assert(page, c('integer', 'numeric'))
  assert(pageSize, c('integer', 'numeric'))
  assert(sort, "character")
  res <- jaod_parse(
    jGET(
      file.path(doaj_base(), "search", "articles", query),
      query = jc(list(page = page, pageSize = pageSize, sort = sort)),
      ...
    )
  )
  res$results <- tibble::as_data_frame(res$results)
  nmo <- c('timestamp', 'page', 'pageSize', 'query', 'total',
           'next', 'last', 'results')
  return(res[nmo])
}
