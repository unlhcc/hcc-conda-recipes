#!/bin/bash

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CPATH=${PREFIX}/include
export LD_LIBRARY_PATH=${PREFIX}/lib
export LIBRARY_PATH=${PREFIX}/lib

if [[ $target_platform =~ linux.* ]] || [[ $target_platform == win-32 ]] || [[ $target_platform == win-64 ]] || [[ $target_platform == osx-64 ]]; then
  export DISABLE_AUTOBREW=1
  mv DESCRIPTION DESCRIPTION.old
  grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
  R CMD INSTALL --build .
else
  mkdir -p $PREFIX/lib/R/library/data.table
  mv * $PREFIX/lib/R/library/data.table
fi
