#!/bin/bash
# https://github.com/jupyterhub/jupyterhub/issues/227

export JULIA_DEPOT_PATH=":/util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.10.2/share/julia"
export JULIA_PROJECT="${HOME}/.julia"
export JULIA_LOAD_PATH="@:@julia-1.10.2:@stdlib"

exec /util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.10.2/bin/julia $@
