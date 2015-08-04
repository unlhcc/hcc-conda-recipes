cp ${PREFIX}/lib/libfftw.a ${SRC_DIR}/ext_lib
cd ${SRC_DIR}/cpp/gcc
rm -f libsrw.a
make all
cp srwlpy.so ${SRC_DIR}/env/work/srw_python
cd ${SRC_DIR}
cp -R env/work/srw_python/* ${SP_DIR}
