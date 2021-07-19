#!/usr/bin/env bash

mkdir -p $PREFIX/{lib,include,bin,share}

# Build DNest4 required for AMORPH
cd $SRC_DIR/DNest4/code
make
cp DNest4.h $PREFIX/include/
cp libdnest4.a  $PREFIX/lib/

# Build AMORPH
cd $SRC_DIR/AMORPH/src
make CC=${CXX} DNEST4_PATH="$SRC_DIR" CPATH="$PREFIX/include" LIBS="-lpthread $PREFIX/lib/libdnest4.a $PREFIX/lib/libyaml-cpp.so"
cp AMORPH $PREFIX/bin
cp *.py $PREFIX/bin
chmod +x $PREFIX/bin/AMORPH
chmod +x $PREFIX/bin/*.py

# Copy input/config test files for AMORPH
mkdir -p $PREFIX/share/test_files
cp $SRC_DIR/AMORPH/src/{easy_data.txt,config.yaml,OPTIONS,OPTIONS_AGGRESSIVE} $PREFIX/share/test_files
