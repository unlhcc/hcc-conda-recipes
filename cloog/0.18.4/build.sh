./configure --prefix=${PREFIX} --with-isl=system --with-isl-prefix=${PREFIX} --with-gmp-prefix=${PREFIX}
make
make check
make install
