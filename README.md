jaod
====



[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/jaod)](https://cranchecks.info/pkgs/jaod)
[![Build Status](https://travis-ci.org/ropensci/jaod.svg?branch=master)](https://travis-ci.org/ropensci/jaod)
[![codecov.io](https://codecov.io/github/ropensci/jaod/coverage.svg?branch=master)](https://codecov.io/github/ropensci/jaod?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/jaod)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/jaod)](https://cran.r-project.org/package=jaod)

`jaod` - R client for [Directory of Open Access Journals API](https://doaj.org/api/v1/docs)

DOAJ API FAQ: <https://doaj.org/faq#apikey>

get started with the package docs: <https://ropensci.github.io/jaod/>

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
#> [1] "2019-09-04T16:58:15.006551Z"
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
#> [1] 95
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=10&pageSize=10"
#> 
#> $results
#> # A tibble: 10 x 40
#>    last_updated id    created_date admin.ticked admin.seal bibjson.allows_…
#>    <chr>        <chr> <chr>        <lgl>        <lgl>      <lgl>           
#>  1 2017-12-11T… 0110… 2014-05-19T… TRUE         NA         TRUE            
#>  2 2018-05-10T… 0223… 2017-06-30T… TRUE         FALSE      TRUE            
#>  3 2018-05-10T… 08d5… 2010-12-21T… TRUE         FALSE      TRUE            
#>  4 2018-05-10T… 097b… 2018-02-09T… TRUE         FALSE      TRUE            
#>  5 2019-04-23T… 1005… 2018-07-23T… TRUE         FALSE      TRUE            
#>  6 2018-05-10T… 1642… 2012-07-13T… TRUE         FALSE      TRUE            
#>  7 2018-10-30T… 1891… 2018-10-30T… TRUE         TRUE       TRUE            
#>  8 2019-07-29T… 1932… 2018-08-24T… TRUE         FALSE      TRUE            
#>  9 2018-05-10T… 1940… 2011-02-07T… TRUE         FALSE      TRUE            
#> 10 2019-04-06T… 1b3a… 2019-04-06T… TRUE         FALSE      TRUE            
#> # … with 34 more variables: bibjson.keywords <list>,
#> #   bibjson.deposit_policy <list>, bibjson.title <chr>,
#> #   bibjson.publication_time <int>, bibjson.provider <chr>,
#> #   bibjson.subject <list>, bibjson.format <list>, bibjson.link <list>,
#> #   bibjson.active <lgl>, bibjson.institution <chr>,
#> #   bibjson.publisher <chr>, bibjson.language <list>,
#> #   bibjson.license <list>, bibjson.alternative_title <chr>,
#> #   bibjson.country <chr>, bibjson.identifier <list>,
#> #   bibjson.apc_url <chr>, bibjson.submission_charges_url <chr>,
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
#> #   bibjson.archiving_policy.nat_lib <chr>, bibjson.apc.currency <chr>,
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
#> [1] "2019-09-04T16:58:15.841886Z"
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
#> [1] 4175566
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/articles/license:CC-BY?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/articles/license:CC-BY?page=417557&pageSize=10"
#> 
#> $results
#> # A tibble: 10 x 23
#>    last_updated id    created_date bibjson.end_page bibjson.start_p…
#>    <chr>        <chr> <chr>        <chr>            <chr>           
#>  1 2019-08-29T… 0000… 2019-06-26T… 440              431             
#>  2 2019-02-21T… 0000… 2015-10-13T… 1740             1737            
#>  3 2019-02-21T… 0000… 2018-07-18T… 418              399             
#>  4 2019-04-02T… 0000… 2013-11-20T… 293              282             
#>  5 2019-08-29T… 0000… 2019-06-26T… 126              109             
#>  6 2019-02-21T… 0000… 2004-05-31T… 209              205             
#>  7 2019-02-21T… 0000… 2014-05-22T… <NA>             <NA>            
#>  8 2019-02-21T… 0000… 2018-02-19T… <NA>             12              
#>  9 2019-02-21T… 0000… 2018-11-04T… 9                1               
#> 10 2019-02-21T… 0000… 2016-10-24T… 620              616             
#> # … with 18 more variables: bibjson.author <list>, bibjson.abstract <chr>,
#> #   bibjson.title <chr>, bibjson.month <chr>, bibjson.link <list>,
#> #   bibjson.year <chr>, bibjson.keywords <list>,
#> #   bibjson.identifier <list>, bibjson.subject <list>,
#> #   bibjson.journal.publisher <chr>, bibjson.journal.language <list>,
#> #   bibjson.journal.license <list>, bibjson.journal.title <chr>,
#> #   bibjson.journal.country <chr>, bibjson.journal.number <chr>,
#> #   bibjson.journal.volume <chr>, bibjson.journal.issns <list>,
#> #   admin.seal <lgl>
```

## get article by id


```r
out2 <- jaod_article(id = "0005e11ec616453f854070069385e057")
names(out2$bibjson)
#> [1] "title"      "journal"    "author"     "month"      "link"      
#> [6] "year"       "identifier" "subject"
```


```r
out2$bibjson$author
#>                                                                                       affiliation
#> 1 Centre for Molecular Biology and Neuroscience & Institute for basic medical sciences, Univ Oslo
#> 2                                                            San Diego Supercomputer Center, UCSD
#>                 name
#> 1 Trygve B Leergaard
#> 2     Ilya Zaslavsky
out2$bibjson$link
#>                                                                     url
#> 1 http://journal.frontiersin.org/Journal/10.3389/neuro.11.009.2007/full
#>       type content_type
#> 1 fulltext         HTML
out2$bibjson$identifier
#>    type                        id
#> 1 eissn                 1662-5196
#> 2   doi 10.3389/neuro.11.009.2007
out2$bibjson$subject
#>   scheme                                                  term      code
#> 1    LCC Neurosciences. Biological psychiatry. Neuropsychiatry RC321-571
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/jaod/issues).
* License: MIT
* Get citation information for `jaod` in R doing `citation(package = jaod')`
* Please note that this project is released with a [Contributor Code of Conduct][coc].
By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

[coc]: https://github.com/ropensci/jaod/blob/master/CODE_OF_CONDUCT.md
