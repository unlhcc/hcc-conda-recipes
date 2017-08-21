#!/bin/bash

# R refuses to build packages that mark themselves as Priority: Recommended
mv DESCRIPTION DESCRIPTION.old
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION

$R CMD INSTALL --build .
#R -e "library(devtools); source("https://bioconductor.org/biocLite.R"); biocLite("Biostrings"); biocLite("Rsamtools"); biocLite("GenomicAlignments"); install_github("SLeviyang/RegressHaplo")"
