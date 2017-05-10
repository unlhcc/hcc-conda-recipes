#!/bin/bash

mkdir -p ${PREFIX}/bin
cp {run_spp.R,run_spp_nodups.R} ${PREFIX}/bin
cp ${RECIPE_DIR}/{run_spp,run_spp_nodups} ${PREFIX}/bin
