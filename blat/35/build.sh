export MACHTYPE
# workaround for Blat's screwy install method
export HOME=${PREFIX}
mkdir -pv ${PREFIX}/bin/${MACHTYPE}
mkdir -pv ${SRC_DIR}/lib/${MACHTYPE}
make
cp ${PREFIX}/bin/${MACHTYPE}/* ${PREFIX}/bin
rm -rf ${PREFIX}/bin/${MACHTYPE}
