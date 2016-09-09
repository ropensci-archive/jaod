jaod
====



[![Build Status](https://travis-ci.org/ropenscilabs/jaod.svg?branch=master)](https://travis-ci.org/ropenscilabs/jaod)

`jaod` - R client for [Directory of Open Access Journals API](https://doaj.org/api/v1/docs)

## installation


```r
devtools::install_github("ropenscilabs/jaod")
```


```r
library("jaod")
```

## search journals


```r
jaod_journal_search(query = "bibjson.keywords:heritage")
#> $timestamp
#> [1] "2016-0909T19:12:35Z"
#> 
#> $page
#> [1] 1
#> 
#> $pageSize
#> [1] 10
#> 
#> $query
#> [1] "bibjson.keywords:heritage"
#> 
#> $total
#> [1] 47
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=5&pageSize=10"
#> 
#> $results
#> # A tibble: 10 × 39
#>            last_updated                               id
#> *                 <chr>                            <chr>
#> 1  2016-09-06T16:54:42Z a77592b0bc7043ad89370fc34bafb61e
#> 2  2016-09-09T15:31:54Z 1642c0a3d74d4218951a597b3ed1193e
#> 3  2016-09-06T16:53:15Z 6f6f2f3ebd6143589a95b54b50480a16
#> 4  2016-09-06T16:56:41Z fa4bf9b1a36d4ddabb0019deba82d43f
#> 5  2016-09-06T16:55:00Z b41c34274fa04f318760687c6b8d1c0f
#> 6  2016-09-06T16:51:57Z 3858157c002e4fd5b20c8f7b44b2f35b
#> 7  2016-09-06T16:56:07Z e0c4c640317943328131a9f087cc4b0f
#> 8  2016-09-06T16:52:04Z 3cb0e8889ca04c8ea6760f32b6c1ba66
#> 9  2016-09-06T16:51:57Z 3811243d06f7401ca906630fbe9da768
#> 10 2016-09-06T16:56:03Z dd8117fc51e948cdbf2e76e77317a2b9
#> # ... with 37 more variables: created_date <chr>,
#> #   bibjson.allows_fulltext_indexing <lgl>, bibjson.keywords <list>,
#> #   bibjson.deposit_policy <list>, bibjson.title <chr>,
#> #   bibjson.publication_time <int>, bibjson.provider <chr>,
#> #   bibjson.subject <list>, bibjson.format <list>, bibjson.apc_url <chr>,
#> #   bibjson.link <list>, bibjson.active <lgl>, bibjson.institution <chr>,
#> #   bibjson.publisher <chr>, bibjson.language <list>,
#> #   bibjson.license <list>, bibjson.country <chr>,
#> #   bibjson.submission_charges_url <chr>, bibjson.identifier <list>,
#> #   bibjson.author_pays <chr>, bibjson.author_pays_url <chr>,
#> #   bibjson.alternative_title <chr>,
#> #   bibjson.persistent_identifier_scheme <list>,
#> #   bibjson.archiving_policy.url <chr>,
#> #   bibjson.archiving_policy.known <list>,
#> #   bibjson.author_publishing_rights.url <chr>,
#> #   bibjson.author_publishing_rights.publishing_rights <chr>,
#> #   bibjson.article_statistics.url <chr>,
#> #   bibjson.article_statistics.statistics <lgl>,
#> #   bibjson.plagiarism_detection.detection <lgl>,
#> #   bibjson.plagiarism_detection.url <chr>, bibjson.oa_start.year <int>,
#> #   bibjson.oa_start.volume <chr>, bibjson.editorial_review.process <chr>,
#> #   bibjson.editorial_review.url <chr>,
#> #   bibjson.author_copyright.url <chr>,
#> #   bibjson.author_copyright.copyright <chr>
```

## get journal by id


```r
out <- jaod_journal(id = "f3f2e7f23d444370ae5f5199f85bc100")
names(out$bibjson)
#>  [1] "allows_fulltext_indexing"     "archiving_policy"            
#>  [3] "persistent_identifier_scheme" "keywords"                    
#>  [5] "apc"                          "deposit_policy"              
#>  [7] "article_statistics"           "title"                       
#>  [9] "publication_time"             "provider"                    
#> [11] "subject"                      "format"                      
#> [13] "plagiarism_detection"         "apc_url"                     
#> [15] "link"                         "oa_start"                    
#> [17] "editorial_review"             "author_copyright"            
#> [19] "publisher"                    "language"                    
#> [21] "license"                      "country"                     
#> [23] "submission_charges_url"       "author_publishing_rights"    
#> [25] "identifier"
```


```r
out$bibjson$archiving_policy
#> $url
#> [1] "http://journals.plos.org/plosbiology/s/publishing-information"
#> 
#> $policy
#>                        name
#> 1                    LOCKSS
#> 2 PMC/Europe PMC/PMC Canada
out$bibjson$apc
#> $currency
#> [1] "USD"
#> 
#> $average_price
#> [1] 2900
out$bibjson$article_statistics
#> $url
#> [1] "http://www.lagotto.io/plos/"
#> 
#> $statistics
#> [1] TRUE
out$bibjson$author_publishing_rights
#> $url
#> [1] "http://journals.plos.org/plosbiology/s/content-license"
#> 
#> $publishing_rights
#> [1] "True"
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/jaod/issues).
* License: MIT
* Get citation information for `jaod` in R doing `citation(package = jaod')`
* Please note that this project is CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
