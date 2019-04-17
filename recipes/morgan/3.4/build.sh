#!/bin/bash


# Set flags
export CFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"
export CPATH=${PREFIX}/include


# Compile program and libraries
make morgan


# Copy libraries
cp *.a ${PREFIX}/lib/


# Copy executables
cp PedComp/ibd_class ${PREFIX}/bin/
cp PedComp/kin ${PREFIX}/bin/
cp PedComp/pedcheck ${PREFIX}/bin/
cp PedComp/translink ${PREFIX}/bin/
cp Genedrop/genedrop ${PREFIX}/bin/
cp Genedrop/ibddrop ${PREFIX}/bin/
cp Genedrop/markerdrop ${PREFIX}/bin/
cp PolyEM/bivar ${PREFIX}/bin/
cp PolyEM/multivar ${PREFIX}/bin/
cp PolyEM/unibig ${PREFIX}/bin/
cp PolyEM/univar ${PREFIX}/bin/
cp Autozyg/civil ${PREFIX}/bin/
cp Autozyg/gl_auto ${PREFIX}/bin/
cp Autozyg/lm_auto ${PREFIX}/bin/
cp Autozyg/lm_ibdtests ${PREFIX}/bin/
cp Autozyg/lm_map ${PREFIX}/bin/
cp Autozyg/lm_pval ${PREFIX}/bin/
cp Lodscore/base_trait_lods ${PREFIX}/bin/
cp Lodscore/gl_lods ${PREFIX}/bin/
cp Lodscore/lm_bayes ${PREFIX}/bin/
cp Lodscore/lm_linkage ${PREFIX}/bin/
cp Lodscore/lm_twoqtl ${PREFIX}/bin/
cp IBD_Haplo/ibd_create ${PREFIX}/bin/
cp IBD_Haplo/ibd_haplo ${PREFIX}/bin/
cp IBD_Haplo/ibd_trios ${PREFIX}/bin/
