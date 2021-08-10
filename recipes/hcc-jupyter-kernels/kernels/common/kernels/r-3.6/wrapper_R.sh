#!/bin/bash

source /util/opt/anaconda/4.9/etc/profile.d/conda.sh
conda activate /util/opt/anaconda/deployed-conda-envs/packages/r/envs/r-3.6.3

exec R $@
