#!/bin/bash

# Unset Intel vars in a deactivation script.

# Restore environment variables (if there is anything to restore)
if [[ ! -z "${CC_CONDA_INTEL_BACKUP+x}" ]]
then
  export CC="${CC_CONDA_INTEL_BACKUP}"
  unset CC_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${CXX_CONDA_INTEL_BACKUP+x}" ]]
then
  export CXX="${CXX_CONDA_INTEL_BACKUP}"
  unset CXX_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${CPP_CONDA_INTEL_BACKUP+x}" ]]
then
  export CPP="${CPP_CONDA_INTEL_BACKUP}"
  unset CPP_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${FC_CONDA_INTEL_BACKUP+x}" ]]
then
  export FC="${FC_CONDA_INTEL_BACKUP}"
  unset FC_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${F90_CONDA_INTEL_BACKUP+x}" ]]
then
  export F90="${F90_CONDA_INTEL_BACKUP}"
  unset F90_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${F77_CONDA_INTEL_BACKUP+x}" ]]
then
  export F77="${F77_CONDA_INTEL_BACKUP}"
  unset F77_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${CFLAGS_CONDA_INTEL_BACKUP+x}" ]]
then
  export CFLAGS="${CFLAGS_CONDA_INTEL_BACKUP}"
  unset CFLAGS_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${DEBUG_CFLAGS_CONDA_INTEL_BACKUP+x}" ]]
then
  export DEBUG_CFLAGS="${DEBUG_CFLAGS_CONDA_INTEL_BACKUP}"
  unset DEBUG_CFLAGS_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${CXXFLAGS_CONDA_INTEL_BACKUP+x}" ]]
then
  export CXXFLAGS="${CXXFLAGS_CONDA_INTEL_BACKUP}"
  unset CXXFLAGS_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${DEBUG_CXXFLAGS_CONDA_INTEL_BACKUP+x}" ]]
then
  export DEBUG_CXXFLAGS="${DEBUG_CXXFLAGS_CONDA_INTEL_BACKUP}"
  unset DEBUG_CXXFLAGS_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${FFLAGS_CONDA_INTEL_BACKUP+x}" ]]
then
  export FFLAGS="${FFLAGS_CONDA_INTEL_BACKUP}"
  unset FFLAGS_CONDA_INTEL_BACKUP
fi

if [[ ! -z "${DEBUG_FFLAGS_CONDA_INTEL_BACKUP+x}" ]]
then
  export DEBUG_FFLAGS="${DEBUG_FFLAGS_CONDA_INTEL_BACKUP}"
  unset DEBUG_FFLAGS_CONDA_INTEL_BACKUP
fi

unset ICCCFG ICPCCFG
