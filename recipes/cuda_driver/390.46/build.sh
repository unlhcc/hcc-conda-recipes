#!/bin/bash

# The driver install must be run as root, so we do that ahead
# of time and create an archive that can be extracted to create
# the conda package.  Not great, but it works.  To create the
# archive, run
# export PREFIX=$PWD/cuda-390.46
#./NVIDIA-Linux-x86_64-390.46.run -s --no-kernel-module \
#  --x-prefix=${PREFIX} --x-module-path=${PREFIX}/lib/xorg/modules \
#  --x-library-path=${PREFIX}/lib --x-sysconfig-path=${PREFIX}/etc/X11 \
#  --opengl-prefix=${PREFIX} --utility-prefix=${PREFIX} \
#  --documentation-prefix=${PREFIX} --compat32-libdir=${PREFIX}/lib --no-install-libglvnd
# tar -czvf nvidia-driver-390.46.tgz cuda-390.46

# Upload the archive to Box with a public shared link and update meta.yaml.

cp -R {bin,etc,lib,share} ${PREFIX}
