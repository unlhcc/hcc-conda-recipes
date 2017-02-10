./configure --prefix=$PREFIX

make -j 4
make check
make install
# Remove GSL's info directory to avoid causing Conda build errors
rm -rf $PREFIX/info
