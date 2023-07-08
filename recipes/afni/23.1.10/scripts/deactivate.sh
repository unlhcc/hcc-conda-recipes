#!/bin/bash
# adapted from https://github.com/conda-forge/nvcc-feedstock/blob/main/recipe/install_nvcc.sh

# Restore environment variables (if there is anything to restore)
if [[ ! -z "${AFNI_PLUGINPATH_CONDA_BACKUP+x}" ]]
then
  export AFNI_PLUGINPATH="${AFNI_PLUGINPATH_CONDA_BACKUP}"
  unset AFNI_PLUGINPATH_CONDA_BACKUP
fi

if [[ ! -z "${AFNI_ATLAS_PATH_CONDA_BACKUP+x}" ]]
then
  export AFNI_ATLAS_PATH="${AFNI_ATLAS_PATH_CONDA_BACKUP}"
  unset AFNI_ATLAS_PATH_CONDA_BACKUP
fi
