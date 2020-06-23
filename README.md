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

get started with the package docs: <https://docs.ropensci.org/jaod/>

## installation

stable CRAN version


```r
install.packages("jaod")
```

development version


```r
resmotes::install_github("ropensci/jaod")
```


```r
library("jaod")
```

## search journals


```r
jaod_journal_search(query = "bibjson.keywords:heritage")
#> $timestamp
#> [1] "2020-06-23T18:59:00.749938Z"
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
#> [1] 108
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/journals/bibjson.keywords:heritage?page=11&pageSize=10"
#> 
#> $results
#> # A tibble: 10 x 40
#>    id    created_date last_updated bibjson.title bibjson.active bibjson.alterna…
#>    <chr> <chr>        <chr>        <chr>         <lgl>          <chr>           
#>  1 0110… 2014-05-19T… 2020-02-03T… "Nailos: Est… TRUE           Nailos          
#>  2 0223… 2017-06-30T… 2020-02-03T… "Journal Sam… TRUE           Sampurasun Inte…
#>  3 041b… 2020-05-28T… 2020-05-28T… "Cuadernos d… TRUE           <NA>            
#>  4 08d5… 2010-12-21T… 2020-02-03T… "Ge-conserva… NA             Ge conservación 
#>  5 097b… 2018-02-09T… 2020-02-03T… "Terr@ Plura… TRUE           <NA>            
#>  6 1005… 2018-07-23T… 2020-02-03T… "Turismo y P… TRUE           Revista Turismo…
#>  7 1642… 2012-07-13T… 2020-02-03T… "In Situ : R… TRUE           <NA>            
#>  8 1891… 2018-10-30T… 2020-04-29T… "ZoneModa Jo… NA             Zone Moda Journ…
#>  9 1924… 2020-04-14T… 2020-04-14T… "Herança"     TRUE           Herança: Revist…
#> 10 1932… 2018-08-24T… 2020-02-03T… "Heritage"    NA             <NA>            
#> # … with 34 more variables: bibjson.country <chr>, bibjson.publisher <chr>,
#> #   bibjson.provider <chr>, bibjson.institution <chr>,
#> #   bibjson.allows_fulltext_indexing <lgl>, bibjson.publication_time <int>,
#> #   bibjson.identifier <list>, bibjson.keywords <list>, bibjson.link <list>,
#> #   bibjson.subject <list>, bibjson.language <list>,
#> #   bibjson.deposit_policy <list>, bibjson.format <list>,
#> #   bibjson.license <list>, bibjson.apc_url <chr>,
#> #   bibjson.submission_charges_url <chr>,
#> #   bibjson.persistent_identifier_scheme <list>, bibjson.oa_start.year <int>,
#> #   bibjson.editorial_review.process <chr>, bibjson.editorial_review.url <chr>,
#> #   bibjson.plagiarism_detection.detection <lgl>,
#> #   bibjson.plagiarism_detection.url <chr>,
#> #   bibjson.article_statistics.statistics <lgl>,
#> #   bibjson.article_statistics.url <chr>,
#> #   bibjson.author_copyright.copyright <chr>,
#> #   bibjson.author_copyright.url <chr>,
#> #   bibjson.author_publishing_rights.publishing_rights <chr>,
#> #   bibjson.author_publishing_rights.url <chr>,
#> #   bibjson.archiving_policy.url <chr>, bibjson.archiving_policy.nat_lib <chr>,
#> #   bibjson.apc.currency <chr>, bibjson.apc.average_price <int>,
#> #   admin.ticked <lgl>, admin.seal <lgl>
```

## get journal by id


```r
out <- jaod_journal(id = "f3f2e7f23d444370ae5f5199f85bc100")
names(out$bibjson)
#>  [1] "allows_fulltext_indexing"     "apc_url"                     
#>  [3] "country"                      "provider"                    
#>  [5] "publication_time"             "publisher"                   
#>  [7] "submission_charges_url"       "title"                       
#>  [9] "apc"                          "archiving_policy"            
#> [11] "article_statistics"           "author_copyright"            
#> [13] "author_publishing_rights"     "editorial_review"            
#> [15] "oa_start"                     "plagiarism_detection"        
#> [17] "deposit_policy"               "format"                      
#> [19] "identifier"                   "keywords"                    
#> [21] "language"                     "license"                     
#> [23] "link"                         "persistent_identifier_scheme"
#> [25] "subject"
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
#> $statistics
#> [1] TRUE
#> 
#> $url
#> [1] "http://www.lagotto.io/plos/"
out$bibjson$author_publishing_rights
#> $publishing_rights
#> [1] "True"
#> 
#> $url
#> [1] "http://journals.plos.org/plosbiology/s/content-license"
```


## search articles


```r
jaod_article_search(query = "license:CC-BY")
#> $timestamp
#> [1] "2020-06-23T18:59:02.032860Z"
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
#> [1] 4935314
#> 
#> $`next`
#> [1] "https://doaj.org/api/v1/search/articles/license:CC-BY?page=2&pageSize=10"
#> 
#> $last
#> [1] "https://doaj.org/api/v1/search/articles/license:CC-BY?page=493532&pageSize=10"
#> 
#> $results
#> # A tibble: 10 x 23
#>    last_updated id    created_date bibjson.identif… bibjson.month
#>    <chr>        <chr> <chr>        <list>           <chr>        
#>  1 2020-04-19T… 0000… 2020-04-19T… <df[,2] [2 × 2]> 4            
#>  2 2020-03-06T… 0000… 2019-06-26T… <df[,2] [1 × 2]> 1            
#>  3 2020-02-03T… 0000… 2015-10-13T… <df[,2] [3 × 2]> 10           
#>  4 2020-02-04T… 0000… 2019-11-11T… <df[,2] [2 × 2]> July         
#>  5 2020-03-02T… 0000… 2019-11-23T… <df[,2] [2 × 2]> November     
#>  6 2020-02-04T… 0000… 2018-07-18T… <df[,2] [2 × 2]> 10           
#>  7 2020-04-02T… 0000… 2013-11-20T… <df[,2] [2 × 2]> <NA>         
#>  8 2020-03-06T… 0000… 2019-06-26T… <df[,2] [1 × 2]> 1            
#>  9 2020-05-31T… 0000… 2020-05-31T… <df[,2] [2 × 2]> 5            
#> 10 2020-02-04T… 0000… 2004-05-31T… <df[,2] [2 × 2]> <NA>         
#> # … with 18 more variables: bibjson.end_page <chr>, bibjson.year <chr>,
#> #   bibjson.start_page <chr>, bibjson.subject <list>, bibjson.author <list>,
#> #   bibjson.link <list>, bibjson.abstract <chr>, bibjson.title <chr>,
#> #   bibjson.keywords <list>, bibjson.journal.volume <chr>,
#> #   bibjson.journal.number <chr>, bibjson.journal.country <chr>,
#> #   bibjson.journal.license <list>, bibjson.journal.issns <list>,
#> #   bibjson.journal.publisher <chr>, bibjson.journal.language <list>,
#> #   bibjson.journal.title <chr>, admin.seal <lgl>
```

## get article by id


```r
out2 <- jaod_article(id = "0005e11ec616453f854070069385e057")
names(out2$bibjson)
#> [1] "title"      "year"       "month"      "journal"    "identifier"
#> [6] "link"       "author"     "subject"
```


```r
out2$bibjson$author
#>                 name
#> 1 Trygve B Leergaard
#> 2     Ilya Zaslavsky
#>                                                                                       affiliation
#> 1 Centre for Molecular Biology and Neuroscience & Institute for basic medical sciences, Univ Oslo
#> 2                                                            San Diego Supercomputer Center, UCSD
out2$bibjson$link
#>       type
#> 1 fulltext
#>                                                                     url
#> 1 http://journal.frontiersin.org/Journal/10.3389/neuro.11.009.2007/full
#>   content_type
#> 1         HTML
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
