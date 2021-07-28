#!/bin/bash
# https://github.com/jupyterhub/jupyterhub/issues/227

export MATLAB_PREFDIR="/tmp/matlab.jupyterhub.${USER}/prefs"
exec /util/opt/anaconda/deployed-conda-envs/packages/matlab-kernel/envs/matlab-kernel-0.16.11-r2020a/bin/python -m matlab_kernel $@
