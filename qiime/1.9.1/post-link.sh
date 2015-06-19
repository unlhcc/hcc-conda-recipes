# Hard-code repo to avoid interactive prompt
cat <<EOF >>${PREFIX}/lib64/R/etc/Rprofile.site
# set a CRAN mirror
local({r <- getOption("repos")
      r["CRAN"] <- "http://mirrors.nics.utk.edu/cran/"
      options(repos=r)})
EOF

# Install required R packages
${PREFIX}/bin/R -e 'update.packages(ask=FALSE)'
${PREFIX}/bin/R -e 'install.packages(c("ape"))'
${PREFIX}/bin/R -e 'install.packages(c("biom"))'
${PREFIX}/bin/R -e 'install.packages(c("optparse"))'
${PREFIX}/bin/R -e 'install.packages(c("RColorBrewer"))'
${PREFIX}/bin/R -e 'install.packages(c("randomForest"))'
${PREFIX}/bin/R -e 'install.packages(c("vegan"))'
${PREFIX}/bin/R -e 'source("http://bioconductor.org/biocLite.R");biocLite(c("DESeq2", "metagenomeSeq"))'
