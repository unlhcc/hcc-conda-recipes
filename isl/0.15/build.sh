./configure --prefix=${PREFIX} --with-gmp-prefix=${PREFIX}
make -j 2
make check
make install
