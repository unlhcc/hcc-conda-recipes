#!/bin/bash

mkdir -p ${PREFIX}/bin

export CFLAGS="$CFLAGS -I$PREFIX/include"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib"
export CPATH=${PREFIX}/include

# copy main script
cp cgmaptools ${PREFIX}/bin

# compile code
cd src
$CXX ATCGmapMerge.cpp -o ${PREFIX}/bin/ATCGmapMerge -lz 
$CXX CGmapSelectByRegion.cpp -o ${PREFIX}/bin/CGmapSelectByRegion
$CXX CGmapMethInBed.cpp  -o ${PREFIX}/bin/CGmapMethInBed
$CXX CGmapMethInFragReg.cpp -o ${PREFIX}/bin/CGmapMethInFragReg
$CC -o ${PREFIX}/bin/CGmapFromBAM CGmapFromBAM.c -lbam -lz
$CC -o ${PREFIX}/bin/CGmapToCGbz CGmapToCGbz.c -lbam -lz
$CC -o ${PREFIX}/bin/CGbzToCGmap CGbzToCGmap.c -lbam -lz
$CC -o ${PREFIX}/bin/ATCGmapToATCGbz ATCGmapToATCGbz.c -lbam -lz
$CC -o ${PREFIX}/bin/ATCGbzToATCGmap ATCGbzToATCGmap.c -lbam -lz
$CC -o ${PREFIX}/bin/CGbzFetchRegion CGbzFetchRegion.c -lbam -lz
$CC -o ${PREFIX}/bin/ATCGbzFetchRegion ATCGbzFetchRegion.c -lbam -lz
cd ..

# copy aux scripts
for file in src/*.py src/*.pl src/*.R
do
pn=`basename $file | cut -d"." -f1`
cp $file ${PREFIX}/bin/$pn
chmod +x ${PREFIX}/bin/$pn
done
