#!/bin/bash

sh ./autogen.sh

for binary in phyml-mpi phyml phyrex; do
	echo ${binary}
	./configure \
		--disable-dependency-tracking \
		--prefix="${PREFIX}" \
		--enable-${binary} \
		LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
	make -j"${CPU_COUNT}"
	make install
	make clean
done
