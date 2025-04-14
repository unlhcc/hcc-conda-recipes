#!/bin/bash
# https://github.com/jupyterhub/jupyterhub/issues/227

export JULIA_DEPOT_PATH=":/util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.11.4/share/julia"
export JULIA_PROJECT="${HOME}/.julia"
export JULIA_LOAD_PATH="@:@julia-1.11.4:@stdlib"
export JULIA_HISTORY="${HOME}/.julia_history"

exec /util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.11.4/bin/julia $@
