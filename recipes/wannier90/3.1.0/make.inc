F90 = ${FC}
FCOPTS = ${FFLAGS} -fPIC -fallow-argument-mismatch
LDOPTS = ${LDFLAGS}
LIBS = -L${PREFIX}/lib -llapack -lblas
COMMS  = mpi
MPIF90 = mpif90
