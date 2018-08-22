jaod
====



[![cran checks](https://cranchecks.info/badges/worst/jaod)](https://cranchecks.info/pkgs/jaod)
[![Build Status](https://travis-ci.org/ropensci/jaod.svg?branch=master)](https://travis-ci.org/ropensci/jaod)
[![codecov.io](https://codecov.io/github/ropensci/jaod/coverage.svg?branch=master)](https://codecov.io/github/ropensci/jaod?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/jaod)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/jaod)](https://cran.r-project.org/package=jaod)

`jaod` - R client for [Directory of Open Access Journals API](https://doaj.org/api/v1/docs)

## installation

stable CRAN version


```r
install.packages("jaod")
```

development version


```r
devtools::install_github("ropensci/jaod")
```


```r
library("jaod")
```

## search journals


```r
jaod_journal_search(query = "bibjson.keywords:heritage")
#> $timestamp
#> [1] "2018-0822T16:58:59Z"
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
#> [1] 79
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=8&pageSize=10"
#> 
#> $results
#> # A tibble: 10 x 39
#>    last_updated id    created_date bibjson.allows_… bibjson.keywords
#>  * <chr>        <chr> <chr>        <lgl>            <list>          
#>  1 2018-05-10T… 0223… 2017-06-30T… TRUE             <chr [1]>       
#>  2 2018-05-10T… 1642… 2012-07-13T… TRUE             <chr [1]>       
#>  3 2018-05-10T… a775… 2016-01-21T… TRUE             <chr [2]>       
#>  4 2018-05-10T… 6f6f… 2016-06-03T… TRUE             <chr [3]>       
#>  5 2018-05-10T… 3858… 2016-03-09T… FALSE            <chr [4]>       
#>  6 2018-06-12T… ff06… 2018-02-11T… TRUE             <chr [3]>       
#>  7 2018-05-22T… 2c6c… 2018-05-22T… TRUE             <chr [4]>       
#>  8 2018-06-12T… b90f… 2018-04-04T… TRUE             <chr [4]>       
#>  9 2018-05-10T… 3811… 2016-02-17T… TRUE             <chr [3]>       
#> 10 2018-05-10T… dd81… 2016-01-07T… TRUE             <chr [5]>       
#> # ... with 34 more variables: bibjson.subject <list>, bibjson.title <chr>,
#> #   bibjson.publication_time <int>, bibjson.provider <chr>,
#> #   bibjson.format <list>, bibjson.apc_url <chr>, bibjson.link <list>,
#> #   bibjson.active <lgl>, bibjson.publisher <chr>,
#> #   bibjson.language <list>, bibjson.license <list>,
#> #   bibjson.alternative_title <chr>, bibjson.country <chr>,
#> #   bibjson.submission_charges_url <chr>, bibjson.identifier <list>,
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
#> #   bibjson.archiving_policy.known <list>,
#> #   bibjson.archiving_policy.other <chr>, bibjson.apc.currency <chr>,
#> #   bibjson.apc.average_price <int>
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
#> [1] "2018-0822T16:59:00Z"
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
#> [1] 3216177
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/articles/license:CC-BY?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/articles/license:CC-BY?page=321618&pageSize=10"
#> 
#> $results
#> # A tibble: 10 x 22
#>    last_updated id    created_date bibjson.start_p… bibjson.author
#>  * <chr>        <chr> <chr>        <chr>            <list>        
#>  1 2017-12-11T… 0086… 2016-12-11T… 930              <data.frame […
#>  2 2017-12-11T… 0087… 2016-06-15T… e43016           <data.frame […
#>  3 2017-12-11T… 0088… 2016-06-14T… e33417           <data.frame […
#>  4 2017-12-11T… 0089… 2016-12-05T… 51               <data.frame […
#>  5 2017-12-11T… 0089… 2016-06-15T… e97781           <data.frame […
#>  6 2017-12-11T… 008a… 2016-06-14T… e50364           <data.frame […
#>  7 2017-12-11T… 008b… 2016-06-15T… e94601           <data.frame […
#>  8 2017-12-11T… 007c… 2016-06-14T… e44718           <data.frame […
#>  9 2017-12-11T… 007e… 2016-06-21T… e0156940         <data.frame […
#> 10 2017-12-11T… 007f… 2016-06-15T… e1001328         <data.frame […
#> # ... with 17 more variables: bibjson.title <chr>, bibjson.subject <list>,
#> #   bibjson.link <list>, bibjson.keywords <list>,
#> #   bibjson.identifier <list>, bibjson.abstract <chr>,
#> #   bibjson.end_page <chr>, bibjson.month <chr>, bibjson.year <chr>,
#> #   bibjson.journal.publisher <chr>, bibjson.journal.language <list>,
#> #   bibjson.journal.license <list>, bibjson.journal.title <chr>,
#> #   bibjson.journal.country <chr>, bibjson.journal.number <chr>,
#> #   bibjson.journal.volume <chr>, bibjson.journal.issns <list>
```

## get article by id


```r
out <- jaod_article(id = "0004c9e6a3c64ec9848607e51b7edbca")
#> Error: Internal Server Error (HTTP 500)
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

* Please [report any issues or bugs](https://github.com/ropensci/jaod/issues).
* License: MIT
* Get citation information for `jaod` in R doing `citation(package = jaod')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)

