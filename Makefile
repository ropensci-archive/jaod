RSCRIPT = Rscript --no-init-file

all: move rmd2md

move:
		cp inst/vign/geojson_vignette.md vignettes/

rmd2md:
		cd vignettes;\
		mv geojson_vignette.md geojson_vignette.Rmd

install: doc build
	R CMD INSTALL . && rm *.tar.gz

build:
	R CMD build .

doc:
	${RSCRIPT} -e "devtools::document()"

eg:
	${RSCRIPT} -e "devtools::run_examples()"

check:
	${RSCRIPT} -e "rcmdcheck::rcmdcheck()"

test:
	${RSCRIPT} -e "devtools::test()"

pkgdocs:
	${RSCRIPT} -e "pkgdown::build_site()"
