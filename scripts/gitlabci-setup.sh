#!/bin/bash
set -e

git checkout master
git fetch
git checkout $CI_COMMIT_BRANCH

for dir in . recipes
do
    if [ -e $dir/meta.yaml ]
    then
        echo "Recipe $dir/meta.yaml found in invalid location."
        echo "Recipes must be stored in a subfolder of the recipes directory."
        exit 1
    fi
done

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
if [[ `uname` == Linux ]]
then
    tag=Linux
    sudo yum install -y -q mesa-libGLU-devel mesa-libGL-devel
    mv -f -v $HOME/.condarc $ANACONDA_PREFIX
#    mkdir -p /ramdisk/conda-bld
#    ln -s /ramdisk/conda-bld $ANACONDA_PREFIX/conda-bld
    mkdir -p .cache/conda_build_src .cache/conda_pkgs
#    ln -s ${CI_PROJECT_DIR}/.cache/conda_build_src /ramdisk/conda-bld/src_cache
    conda config --system --add pkgs_dirs /opt/conda/pkgs
    conda config --system --add pkgs_dirs ${CI_PROJECT_DIR}/.cache/conda_pkgs

else
    tag=MacOSX
    # install conda via micromambaa
    curl -Ls https://micromamba.snakepit.net/api/micromamba/osx-64/0.20.0 | tar -xvj bin/micromamba
    ./bin/micromamba create -y -q --ssl-verify=true -p $ANACONDA_PREFIX "conda=4.12.0" "conda-build=3.21.8" "markupsafe<2.1" -c conda-forge
    export CONDARC=$ANACONDA_PREFIX/.condarc && rm -rf ~/.condarc
    source $ANACONDA_PREFIX/etc/profile.d/conda.sh
    conda activate base

    # set channels
    conda config --system --add channels bioconda
    conda config --system --add channels conda-forge

fi

# install bioconda-utils required packages
conda install -q -y --file https://raw.githubusercontent.com/acaprez/bioconda-utils/${HCC_BIOCONDA_UTILS_TAG}/bioconda_utils/bioconda_utils-requirements.txt

# add HCC channel
conda config --system --add channels hcc
# more threads
conda config --system --set repodata_threads 4
conda config --system --set execute_threads 2
conda config --system --set verify_threads 4

# install HCC-ized bioconda-utils
pip install -q --force-reinstall git+https://github.com/acaprez/bioconda-utils.git@${HCC_BIOCONDA_UTILS_TAG}

mkdir -p $ANACONDA_PREFIX/conda-bld/{noarch,linux-64,osx-64}
conda index $ANACONDA_PREFIX/conda-bld
conda config --system --add channels file://$ANACONDA_PREFIX/conda-bld
$(set +x; sed -i -e s/TOKEN/${PRIVATE_PACKAGE_TOKEN}/g $SCRIPT_DIR/../config.yml)
conda config --system --set changeps1 False
