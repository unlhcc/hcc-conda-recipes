#!/bin/bash
# https://github.com/jupyterhub/jupyterhub/issues/227

export PATH=/util/opt/anaconda/deployed-conda-envs/packages/octave/envs/octave-4.2.1/bin:$PATH
export OCTAVE_EXECUTABLE=/util/opt/anaconda/deployed-conda-envs/packages/octave/envs/octave-4.2.1/bin/octave-cli
export OCTAVE_HOME=/util/opt/anaconda/deployed-conda-envs/packages/octave/envs/octave-4.2.1
exec /util/opt/anaconda/deployed-conda-envs/packages/octave/envs/octave-4.2.1/bin/python $@
