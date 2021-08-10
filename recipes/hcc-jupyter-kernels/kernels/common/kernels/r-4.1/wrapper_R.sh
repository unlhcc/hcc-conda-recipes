#!/bin/bash

source /util/opt/anaconda/4.9/etc/profile.d/conda.sh
conda activate /util/opt/anaconda/deployed-conda-envs/packages/r/envs/r-4.1.0

exec R $@
