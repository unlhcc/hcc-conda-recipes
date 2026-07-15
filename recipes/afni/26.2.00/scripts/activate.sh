#!/bin/bash
# adapted from https://github.com/conda-forge/nvcc-feedstock/blob/main/recipe/install_nvcc.sh

# Backup environment variables (only if the variables are set)
if [[ ! -z "${AFNI_PLUGINPATH+x}" ]]
then
  export AFNI_PLUGINPATH_CONDA_BACKUP="${AFNI_PLUGINPATH:-}"
fi

if [[ ! -z "${AFNI_ATLAS_PATH+x}" ]]
then
  export AFNI_ATLAS_PATH_CONDA_BACKUP="${AFNI_ATLAS_PATH:-}"
fi

AFNI_HOME=/opt/anaconda1anaconda2anaconda3
export AFNI_PLUGINPATH=${AFNI_HOME}/lib
export AFNI_ATLAS_PATH=${AFNI_HOME}/share/AFNI/data
