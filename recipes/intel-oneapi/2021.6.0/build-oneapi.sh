#!/bin/bash
# adapted from https://github.com/oneapi-src/oneapi-ci/blob/master/scripts/install_linux_no_sudo.sh

# SPDX-FileCopyrightText: 2020 Intel Corporation
#
# SPDX-License-Identifier: MIT

# workaround to avoid install data/logs in the home directory
export HOME=`mktemp -d`

export COMPONENTS="intel.oneapi.lin.ifort-compiler:intel.oneapi.lin.dpcpp-cpp-compiler-pro"
chmod +x webimage.sh
./webimage.sh -x -f webimage_extracted --log extract.log
rm -rf webimage.sh
WEBIMAGE_NAME=$(ls -1 webimage_extracted/)
if [ -z "$COMPONENTS" ]; then
  webimage_extracted/"$WEBIMAGE_NAME"/bootstrapper -s --action install --eula=accept --log-dir=/tmp --install-dir=${PREFIX}
  installer_exit_code=$?
else
  webimage_extracted/"$WEBIMAGE_NAME"/bootstrapper -s --action install --components="$COMPONENTS" --eula=accept --log-dir=/tmp --install-dir=${PREFIX}
  installer_exit_code=$?
fi
rm -rf webimage_extracted

# somehow these zero-size files break the conda post-build code. your guess is as good as mine.
rm -vf ${PREFIX}/compiler/latest/linux/lib/oclfpga/linux64/lib/dspba/linux64/fir_ip_api_interface.exe  \
 ${PREFIX}/compiler/latest/linux/lib/oclfpga/linux64/lib/dspba/linux64/fir_ip_api_interface.bin.exe

# custom compiler config files
mkdir -p ${PREFIX}/etc/oneapi ${PREFIX}/bin
cp ${RECIPE_DIR}/{icc.cfg,icpc.cfg,ifort.cfg} ${PREFIX}/etc/oneapi

# activate/deactivate scripts
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cp ${RECIPE_DIR}/activate.sh ${PREFIX}/etc/conda/activate.d/${PKG_NAME}.sh
cp ${RECIPE_DIR}/deactivate.sh ${PREFIX}/etc/conda/deactivate.d/${PKG_NAME}.sh

# remove unneeded bits since the installer insists on these
rm -rf ${PREFIX}/{conda_channel,logs,debugger}
rm -rf ${PREFIX}/compiler/latest/linux/lib/oclfpga
#rm -rf ${PREFIX}/compiler/latest/linux/compiler/lib/ia32*
#rm -rf ${PREFIX}/compiler/latest/linux/bin/ia32

# link in the various libs scattered about into ${PREFIX}/lib
for f in `ls -1d ${PREFIX}/compiler/latest/linux/bin/intel64/*`; do ln -fs $f ${PREFIX}/bin; done
for f in `ls -1d ${PREFIX}/compiler/latest/linux/lib/*`; do ln -fs $f ${PREFIX}/lib; done
for f in `ls -1d ${PREFIX}/compiler/latest/linux/lib/x64/*`; do ln -fs $f ${PREFIX}/lib; done
for f in `ls -1d ${PREFIX}/compiler/latest/linux/compiler/lib/intel64_lin/*`; do ln -fs $f ${PREFIX}/lib; done
