#!/bin/bash

# Set Intel-related vars
#if [[ ! -d "$INTEL_HOME" ]]
#then
#    echo "Directory ${INTEL_HOME} doesn't exist!"
#    return 1
#fi

# Backup environment variables (only if the variables are set)
if [[ ! -z "${LD_LIBRARY_PATH+x}" ]]
then
  export LD_LIBRARY_PATH_CONDA_INTEL_BACKUP="${LD_LIBRARY_PATH:-}"
fi

if [[ ! -z "${LIBRARY_PATH+x}" ]]
then
  export LIBRARY_PATH_CONDA_INTEL_BACKUP="${LIBRARY_PATH:-}"
fi

if [[ ! -z "${CFLAGS+x}" ]]
then
  export CFLAGS_CONDA_INTEL_BACKUP="${CFLAGS:-}"
fi

if [[ ! -z "${DEBUG_CFLAGS+x}" ]]
then
  export DEBUG_CFLAGS_CONDA_INTEL_BACKUP="${DEBUG_CFLAGS:-}"
fi

if [[ ! -z "${CXXFLAGS+x}" ]]
then
  export CXXFLAGS_CONDA_INTEL_BACKUP="${CXXFLAGS:-}"
fi

if [[ ! -z "${DEBUG_CXXFLAGS+x}" ]]
then
  export DEBUG_CFLAGS_CONDA_INTEL_BACKUP="${DEBUG_CXXFLAGS:-}"
fi

if [[ ! -z "${FFLAGS+x}" ]]
then
  export CPPFLAGS_CONDA_INTEL_BACKUP="${FFLAGS:-}"
fi

if [[ ! -z "${DEBUG_FFLAGS+x}" ]]
then
  export DEBUG_CFLAGS_CONDA_INTEL_BACKUP="${DEBUG_FFLAGS:-}"
fi

if [[ ! -z "${CC+x}" ]]
then
  export CC_CONDA_INTEL_BACKUP="${CC:-}"
fi

if [[ ! -z "${CXX+x}" ]]
then
  export CXX_CONDA_INTEL_BACKUP="${CXX:-}"
fi

if [[ ! -z "${CPP+x}" ]]
then
  export CPP_CONDA_INTEL_BACKUP="${CPP:-}"
fi

if [[ ! -z "${FC+x}" ]]
then
  export FC_CONDA_INTEL_BACKUP="${FC:-}"
fi

if [[ ! -z "${F90+x}" ]]
then
  export F90_CONDA_INTEL_BACKUP="${F90:-}"
fi

if [[ ! -z "${F77+x}" ]]
then
  export F77_CONDA_INTEL_BACKUP="${F77:-}"
fi

export CC=/opt/anaconda1anaconda2anaconda3/bin/icc CXX=/opt/anaconda1anaconda2anaconda3/bin/icpc CPP="/opt/anaconda1anaconda2anaconda3/bin/icc -E"
export FC=/opt/anaconda1anaconda2anaconda3/bin/ifort F77=/opt/anaconda1anaconda2anaconda3/bin/ifort F90=/opt/anaconda1anaconda2anaconda3/bin/ifort
export CFLAGS="-march=nocona -mtune=haswell -fPIC -fstack-protector-strong -O2 -ffunction-sections -isystem /opt/anaconda1anaconda2anaconda3/x86_64-conda-linux-gnu/sysroot/usr/include"
export DEBUG_CFLAGS="-march=nocona -mtune=haswell -fPIC -fstack-protector-all -O0 -g -Wall -ffunction-sections -isystem /opt/anaconda1anaconda2anaconda3/x86_64-conda-linux-gnu/sysroot/usr/include"
export CXXFLAGS="-march=nocona -mtune=haswell -fPIC -fstack-protector-strong -O2 -ffunction-sections  -isystem /opt/anaconda1anaconda2anaconda3/x86_64-conda-linux-gnu/sysroot/usr/include"
export DEBUG_CXXFLAGS="-march=nocona -mtune=haswell -fPIC -fstack-protector-all -O0 -g -Wall -ffunction-sections -isystem /opt/anaconda1anaconda2anaconda3/x86_64-conda-linux-gnu/sysroot/usr/include"
export FFLAGS="-march=nocona -mtune=haswell -fPIC -fstack-protector-strong -O2 -isystem /opt/anaconda1anaconda2anaconda3/x86_64-conda-linux-gnu/sysroot/usr/include"
export DEBUG_FFLAGS="-march=nocona -mtune=haswell -fPIC -fstack-protector-all -O0 -g -Wall -isystem /opt/anaconda1anaconda2anaconda3/x86_64-conda-linux-gnu/sysroot/usr/include"
export LD_LIBRARY_PATH=/opt/anaconda1anaconda2anaconda3/lib
export LIBRARY_PATH=/opt/anaconda1anaconda2anaconda3/lib
export ICCCFG=/opt/anaconda1anaconda2anaconda3/etc/oneapi/icc.cfg
export ICPCCFG=/opt/anaconda1anaconda2anaconda3/etc/oneapi/icpc.cfg
export IFORTCFG=/opt/anaconda1anaconda2anaconda3/etc/oneapi/ifort.cfg
