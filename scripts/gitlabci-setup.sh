#!/bin/bash
set -e
set -x

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
    dockerd -s vfs&
    sleep 5
else
    tag=MacOSX
    SUDO=""
fi

# install conda
curl -O https://repo.continuum.io/miniconda/Miniconda3-$MINICONDA_VER-$tag-x86_64.sh
$SUDO bash Miniconda3-$MINICONDA_VER-$tag-x86_64.sh -b -p $ANACONDA_PREFIX
export PATH=$ANACONDA_PREFIX/bin:$PATH

$SCRIPT_DIR/../simulate-gitlabci.py --set-channel-order
$SCRIPT_DIR/../simulate-gitlabci.py --install-requirements

conda index $ANACONDA_PREFIX/conda-bld/linux-64 $ANACONDA_PREFIX/conda-bld/osx-64
conda config --add channels file://$ANACONDA_PREFIX/conda-bld
