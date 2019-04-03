#!/bin/bash

OUT=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${OUT}

cp -rvp . ${PREFIX}
cd ${PREFIX}
make vcf2bam
cp dist/*.jar ${OUT}
cp dist/vcf2bam ${OUT}

ln -s ${OUT}/vcf2bam ${PREFIX}/bin

chmod +x ${PREFIX}/bin/vcf2bam
