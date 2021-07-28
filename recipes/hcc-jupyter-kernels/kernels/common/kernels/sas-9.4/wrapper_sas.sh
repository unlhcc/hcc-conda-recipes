#!/bin/bash

# needed to find sascfg_personal.py
export PYTHONPATH=/opt/anaconda1anaconda2anaconda3/share/hcc-jupyter-kernels/common/kernels/sas-9.4:$PYTHONPATH

exec /util/opt/anaconda/deployed-conda-envs/packages/sas-ipykernel/envs/sas-ipykernel-2.4.11/bin/python $@
