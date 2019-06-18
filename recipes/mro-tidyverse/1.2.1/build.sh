#!/bin/bash

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export LIBRARY_PATH=${PREFIX}/lib

# The 'haven' and 'readxl' packages' shared libraries need to be linked against
# libiconv and libz.  So first install all of their deps using a custom Makevars
# file to ~/.R for the anaconda compilers. Then add the needed linking options
# so it will be used for those packages alone.  Then restore the original
# Makevars and install the rest of the tidyverse stack.
mkdir -p ~/.R && cp ${RECIPE_DIR}/Makevars.gcc ~/.R/Makevars
Rscript -e "install.packages(c('assertthat','fansi','utf8','magrittr','rlang','pkgconfig','BH','cli','crayon','pillar','forcats','hms','Rcpp','readr','tibble','rematch','rlang','cellranger'))"
cat ${RECIPE_DIR}/Makevars.lib >> ~/.R/Makevars
Rscript -e 'install.packages(c("haven","readxl"))'
rm -rf ~/.R & mkdir -p ~/.R && cp ${RECIPE_DIR}/Makevars.gcc ~/.R/Makevars
Rscript -e 'install.packages("tidyverse")'
