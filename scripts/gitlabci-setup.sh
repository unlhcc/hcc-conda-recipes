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
dockerd -s vfs&
sleep 5
if [[ `uname` == Linux ]]
then
    tag=Linux
else
    tag=MacOSX
fi

# install conda
curl -O https://repo.continuum.io/miniconda/Miniconda3-$MINICONDA_VER-$tag-x86_64.sh
sudo bash Miniconda3-$MINICONDA_VER-$tag-x86_64.sh -b -p /anaconda
export PATH=/anaconda/bin:$PATH

$SCRIPT_DIR/../simulate-gitlabci.py --set-channel-order
$SCRIPT_DIR/../simulate-gitlabci.py --install-requirements

conda index /anaconda/conda-bld/linux-64 /anaconda/conda-bld/osx-64
conda config --add channels file://anaconda/conda-bld
