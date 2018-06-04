#!/bin/bash

for f in `ls -1 rpm`
do
    rpm2cpio rpm/$f | cpio -idm
done

mkdir -p ${PREFIX}/bin ${PREFIX}/lib

cp -aR opt/microsoft/ropen/3.4.4/{lib64,share} ${PREFIX}
mv ${PREFIX}/lib64 ${PREFIX}/lib
cp opt/microsoft/ropen/3.4.4/stage/Linux/bin/x64/*.so ${PREFIX}/lib/lib64/R/lib

ln -s ${PREFIX}/lib/lib64/R/bin/R ${PREFIX}/bin/R
ln -s ${PREFIX}/lib/lib64/R/bin/Rscript ${PREFIX}/bin/Rscript
