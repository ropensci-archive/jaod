jaod
====



[![Build Status](https://travis-ci.org/ropenscilabs/jaod.svg?branch=master)](https://travis-ci.org/ropenscilabs/jaod)

`jaod` - R client for [Directory of Open Access Journals API](https://doaj.org/api/v1/docs)

## installation

stable CRAN version


```r
install.packages("knitr")
```

development version


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
#> [1] "2017-0901T02:56:34Z"
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
#> [1] 55
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=6&pageSize=10"
#> 
#> $results
#> # A tibble: 10 x 36
#>            last_updated                               id
#>  *                <chr>                            <chr>
#>  1 2017-02-28T13:05:18Z 1642c0a3d74d4218951a597b3ed1193e
#>  2 2017-06-30T14:29:20Z 02233e98710842d4a296c3dc7e472aa4
#>  3 2017-02-28T13:08:53Z a77592b0bc7043ad89370fc34bafb61e
#>  4 2017-02-28T13:07:34Z 6f6f2f3ebd6143589a95b54b50480a16
#>  5 2017-02-28T13:06:07Z 3858157c002e4fd5b20c8f7b44b2f35b
#>  6 2017-02-28T13:06:07Z 3811243d06f7401ca906630fbe9da768
#>  7 2017-02-28T13:10:20Z dd8117fc51e948cdbf2e76e77317a2b9
#>  8 2017-02-28T13:05:26Z 1c246063422f40fb99bf09042fc92aa0
#>  9 2017-05-16T11:19:47Z e57245a3ad2a4ec6a915ce2b73aba68b
#> 10 2017-02-28T13:10:22Z df7ef7c05f9542f6b4270f23954cc230
#> # ... with 34 more variables: created_date <chr>,
#> #   bibjson.allows_fulltext_indexing <lgl>, bibjson.keywords <list>,
#> #   bibjson.subject <list>, bibjson.title <chr>,
#> #   bibjson.publication_time <int>, bibjson.provider <chr>,
#> #   bibjson.format <list>, bibjson.apc_url <chr>, bibjson.link <list>,
#> #   bibjson.active <lgl>, bibjson.publisher <chr>,
#> #   bibjson.language <list>, bibjson.license <list>,
#> #   bibjson.country <chr>, bibjson.submission_charges_url <chr>,
#> #   bibjson.identifier <list>, bibjson.alternative_title <chr>,
#> #   bibjson.deposit_policy <list>, bibjson.institution <chr>,
#> #   bibjson.persistent_identifier_scheme <list>,
#> #   bibjson.author_publishing_rights.url <chr>,
#> #   bibjson.author_publishing_rights.publishing_rights <chr>,
#> #   bibjson.article_statistics.url <chr>,
#> #   bibjson.article_statistics.statistics <lgl>,
#> #   bibjson.plagiarism_detection.detection <lgl>,
#> #   bibjson.plagiarism_detection.url <chr>, bibjson.oa_start.year <int>,
#> #   bibjson.editorial_review.process <chr>,
#> #   bibjson.editorial_review.url <chr>,
#> #   bibjson.author_copyright.url <chr>,
#> #   bibjson.author_copyright.copyright <chr>,
#> #   bibjson.archiving_policy.url <chr>,
#> #   bibjson.archiving_policy.known <list>
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


## search articles


```r
jaod_article_search(query = "license:CC-BY")
#> $timestamp
#> [1] "2017-0901T02:56:36Z"
#> 
#> $page
#> [1] 1
#> 
#> $pageSize
#> [1] 10
#> 
#> $query
#> [1] "license:CC-BY"
#> 
#> $total
#> [1] 2482365
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/articles/license:CC-BY?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/articles/license:CC-BY?page=248237&pageSize=10"
#> 
#> $results
#> # A tibble: 10 x 22
#>            last_updated                               id
#>  *                <chr>                            <chr>
#>  1 2017-01-31T07:39:30Z 73f180906a634002a6fdf900d4010f50
#>  2 2016-09-07T17:58:38Z 73f2e93dc3ce42f59a26891c198dbbe0
#>  3 2016-09-07T17:58:39Z 73f3953c9d434ea1a698c607b6e52cd9
#>  4 2016-09-07T17:58:40Z 73f5b8dc01814a0f85ca52b3ef105924
#>  5 2016-07-08T07:15:54Z 73f5d77454df451aac308e90418b466c
#>  6 2016-12-12T01:30:17Z 73f69c2374da4899ac2e0f8be44cc31e
#>  7 2016-09-07T17:58:42Z 73f781ad57094b98a0b46d8903fdc2c2
#>  8 2016-09-07T17:58:42Z 73f845a2c6f1418281aeed6c5164ae28
#>  9 2016-06-24T21:14:27Z 73f8c23c3841400b921b94ff5bc5cae2
#> 10 2016-09-07T17:58:43Z 73f9b8a7776d488092b79ffaa72caba6
#> # ... with 20 more variables: created_date <chr>, bibjson.end_page <chr>,
#> #   bibjson.start_page <chr>, bibjson.author <list>,
#> #   bibjson.abstract <chr>, bibjson.title <chr>, bibjson.month <chr>,
#> #   bibjson.link <list>, bibjson.year <chr>, bibjson.keywords <list>,
#> #   bibjson.identifier <list>, bibjson.subject <list>,
#> #   bibjson.journal.publisher <chr>, bibjson.journal.language <list>,
#> #   bibjson.journal.license <list>, bibjson.journal.title <chr>,
#> #   bibjson.journal.country <chr>, bibjson.journal.number <chr>,
#> #   bibjson.journal.volume <chr>, bibjson.journal.issns <list>
```

## get article by id


```r
out <- jaod_article(id = "0004c9e6a3c64ec9848607e51b7edbca")
#> Error: Internal Server Error (HTTP 500).
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
out$bibjson$author
#> NULL
out$bibjson$link
#>                                                                                   url
#> 1                                               http://journals.plos.org/plosbiology/
#> 2 https://www.plos.org/publications/publication-fees/plos-publication-fee-assistance/
#> 3                              http://journals.plos.org/plosbiology/s/editorial-board
#> 4                http://journals.plos.org/plosbiology/s/journal-information#loc-scope
#> 5                        http://journals.plos.org/plosbiology/s/submission-guidelines
#> 6          http://journals.plos.org/plosbiology/s/journal-information#loc-open-access
#>                  type
#> 1            homepage
#> 2       waiver_policy
#> 3     editorial_board
#> 4          aims_scope
#> 5 author_instructions
#> 6        oa_statement
out$bibjson$identifier
#>    type        id
#> 1 pissn 1544-9173
#> 2 eissn 1545-7885
out$bibjson$subject
#>   scheme              term        code
#> 1    LCC Biology (General) QH301-705.5
```


## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/jaod/issues).
* License: MIT
* Get citation information for `jaod` in R doing `citation(package = jaod')`
* Please note that this project is CONDUCT.md). By participating in this project you agree to abide by its terms.
