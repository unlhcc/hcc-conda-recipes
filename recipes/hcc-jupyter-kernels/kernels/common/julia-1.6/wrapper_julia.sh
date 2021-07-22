#!/bin/bash
# https://github.com/jupyterhub/jupyterhub/issues/227

export JULIA_DEPOT_PATH=":/util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.6.1/share/julia/site"
export JULIA_PROJECT="${HOME}/.julia"

exec /util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.6.1/bin/julia $@
