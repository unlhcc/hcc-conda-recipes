#!/bin/bash

mkdir -p ${PREFIX}/bin ${PREFIX}/lib ${PREFIX}/include
make CC="${CC}" COPTIONS="${CFLAGS}" LDOPTIONS="${LDFLAGS}"
cp {pmetis,kmetis,oemetis,onmetis,partnmesh,partdmesh,mesh2nodal,mesh2dual,graphchk} ${PREFIX}/bin
cp libmetis.a ${PREFIX}/lib
cp Lib/*.h ${PREFIX}/include
