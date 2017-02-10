./configure --enable-shared --disable-xmms-plugin --prefix=${PREFIX} --with-ogg=${PREFIX}
make
make check
make install
