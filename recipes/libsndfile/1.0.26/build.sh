./configure --enable-shared --prefix=${PREFIX} --with-pkgconfigdir=${PREFIX}/lib/pkgconfig
make
make check
make install
