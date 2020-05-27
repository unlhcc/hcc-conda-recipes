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
else
    tag=MacOSX
    SUDO=""
    # install conda
    curl -L -O https://repo.continuum.io/miniconda/Miniconda3-$MINICONDA_VER-$tag-x86_64.sh
    $SUDO bash Miniconda3-$MINICONDA_VER-$tag-x86_64.sh -b -p $ANACONDA_PREFIX
    source $ANACONDA_PREFIX/etc/profile.d/conda.sh
    conda activate base
    # https://github.com/acaprez/bioconda-utils/commit/ac7924ef3ce5a8239fdc8a9516a81d1c09af7df5
    conda install -y -q --freeze-installed conda=4.8.2

    # set channels
    conda config --add channels bioconda
    conda config --add channels conda-forge
fi

# install bioconda-utils required packages
conda install -q -y --file https://raw.githubusercontent.com/acaprez/bioconda-utils/${HCC_BIOCONDA_UTILS_TAG}/bioconda_utils/bioconda_utils-requirements.txt

# add HCC channel
conda config --add channels hcc

# install HCC-ized bioconda-utils
pip install -q --force-reinstall git+https://github.com/acaprez/bioconda-utils.git@${HCC_BIOCONDA_UTILS_TAG}

mkdir -p $ANACONDA_PREFIX/conda-bld/{noarch,linux-64,osx-64}
conda index $ANACONDA_PREFIX/conda-bld
conda config --add channels file://$ANACONDA_PREFIX/conda-bld
$(set +x; sed -i -e s/TOKEN/${PRIVATE_PACKAGE_TOKEN}/g $SCRIPT_DIR/../config.yml)
conda config --set changeps1 False
