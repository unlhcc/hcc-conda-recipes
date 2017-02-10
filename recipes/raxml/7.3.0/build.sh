mkdir -pv $PREFIX/bin
make -f Makefile.AVX.gcc
cp raxmlHPC-AVX $PREFIX/bin
