#!/bin/bash
# https://github.com/jupyterhub/jupyterhub/issues/227

export PATH=/util/opt/anaconda/deployed-conda-envs/packages/octave/envs/octave-7.2.0/bin:$PATH
export OCTAVE_EXECUTABLE=/util/opt/anaconda/deployed-conda-envs/packages/octave/envs/octave-7.2.0/bin/octave-cli
export OCTAVE_HOME=/util/opt/anaconda/deployed-conda-envs/packages/octave/envs/octave-7.2.0
exec /util/opt/anaconda/deployed-conda-envs/packages/octave/envs/octave-7.2.0/bin/python $@
