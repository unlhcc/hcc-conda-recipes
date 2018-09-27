#!/bin/bash

# The RHEL/CentOS MRO is linked against libpng12, but we can't
# install that via conda as freetype/fontconfig need newer versions.
# So we install it via yum instead.  Ick.
sudo yum -y -q install libpng

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export LIBRARY_PATH=${PREFIX}/lib

# The 'haven' and 'readxl' packages' shared libraries need to be linked against
# libiconv.  So first install all of their deps; then copy a custom Makevars
# file to ~/.R so it will be used for those packages alone.  Then remove
# the custom Makevars and install the rest of the tidyverse stack.
Rscript -e "install.packages(c('assertthat','fansi','utf8','magrittr','rlang','pkgconfig','BH','cli','crayon','pillar','forcats','hms','Rcpp','readr','tibble','rematch','rlang','cellranger'))"
mkdir -p ~/.R && cp ${RECIPE_DIR}/Makevars ~/.R
Rscript -e 'install.packages(c("haven","readxl"))'
rm -rf ~/.R
Rscript -e 'install.packages("tidyverse")'
