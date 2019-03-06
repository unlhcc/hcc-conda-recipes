#!/bin/bash

# copy main R scripts
chmod +x R/*.R
cp R/*.R ${PREFIX}/bin

# copy R scripts
chmod +x scripts/R_scripts/*.R
cp scripts/R_scripts/*.R ${PREFIX}/bin

# Copy python script
chmod +x scripts/snakemake/code/countPysam.py
cp scripts/snakemake/code/countPysam.py ${PREFIX}/bin

# Copy extra scripts
chmod +x scripts/TenX_scripts/*.R
cp scripts/TenX_scripts/*.R ${PREFIX}/bin
chmod +x scripts/TenX_scripts/*.py
cp scripts/TenX_scripts/*.py ${PREFIX}/bin

# Create folder for config files
target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${target}

# Copy config files
cp -r scripts/snakemake/config ${target}
cp scripts/snakemake/*.snakefile ${target}
