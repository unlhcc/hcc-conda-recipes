#!/bin/bash
set -e
set -x

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
    SUDO=sudo
    dockerd &
    sleep 10
    # completely remove existing conda install to avoid strange cross-contamination issues
    rm -rf /opt/conda
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin

else
    tag=MacOSX
    SUDO=""
fi

# install conda
curl -L -O https://repo.continuum.io/miniconda/Miniconda3-$MINICONDA_VER-$tag-x86_64.sh
$SUDO bash Miniconda3-$MINICONDA_VER-$tag-x86_64.sh -b -p $ANACONDA_PREFIX
source $ANACONDA_PREFIX/etc/profile.d/conda.sh
conda activate base

# set channels
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --add channels hcc

# install bioconda-utils required pacakges
conda install -q -y --file https://raw.githubusercontent.com/acaprez/bioconda-utils/${HCC_BIOCONDA_UTILS_TAG}/bioconda_utils/bioconda_utils-requirements.txt

# install HCC-ized bioconda-utils
pip install -q git+https://github.com/acaprez/bioconda-utils.git@${HCC_BIOCONDA_UTILS_TAG}

mkdir -p $ANACONDA_PREFIX/conda-bld/{noarch,linux-64,osx-64}
conda index $ANACONDA_PREFIX/conda-bld
conda config --add channels file://$ANACONDA_PREFIX/conda-bld
$(set +x; sed -i -e s/TOKEN/${PRIVATE_PACKAGE_TOKEN}/g $SCRIPT_DIR/../config.yml)
