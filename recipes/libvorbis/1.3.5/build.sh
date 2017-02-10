./configure --enable-shared --prefix=${PREFIX} --with-ogg=${PREFIX}
make
make check
make install
