#!/bin/bash

R -e "library(devtools)"
R -e "devtools::install_github(repo='ryantibs/best-subset', subdir='bestsubset')"
R CMD INSTALL --build bestsubset
