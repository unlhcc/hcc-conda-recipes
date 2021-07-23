#!/bin/bash
# https://github.com/jupyterhub/jupyterhub/issues/227

export JULIA_DEPOT_PATH="${WORK}/.julia:/util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.1.1/local/share/julia:/util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.1.1/share/julia"
export JULIA_PROJECT="${WORK}/.julia"
export JULIA_LOAD_PATH=":/util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.1.1/share/julia/environments/v1.1"

exec /util/opt/anaconda/deployed-conda-envs/packages/julia/envs/julia-1.1.1/bin/julia $@
