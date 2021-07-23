#!/bin/bash
# https://github.com/jupyterhub/jupyterhub/issues/227

export MATLAB_PREFDIR="/tmp/matlab.jupyterhub.${USER}/prefs"
exec /util/opt/anaconda/4.3/envs/matlab-ipykernel/bin/python -m matlab_kernel $@
