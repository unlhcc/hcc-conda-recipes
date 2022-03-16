#!/bin/bash

cd ${RAPTORX_3DMODELING_DATA}

# Deep learning model files
wget https://zenodo.org/record/4710337/files/RXDeepModels4DistOri-FM.tar.gz .
wget https://zenodo.org/record/4710337/files/RXDeepModels4Property.tar.gz .

# Metagenome data
wget https://metaclust.mmseqs.org/current_release/metaclust_50.fasta.gz .
tar xvf metaclust_50.fasta.gz

# HHsuite sequence database
wget http://wwwuser.gwdg.de/~compbiol/uniclust/2020_03/UniRef30_2020_03_hhsuite.tar.gz .
tar xvf UniRef30_2020_03_hhsuite.tar.gz


# Put deep learning model files in correct directories
tar xvf RXDeepModels4DistOri-FM.tar.gz
mv models/ ${ModelingHome}/DL4DistancePrediction4/
tar xvf RXDeepModels4Property.tar.gz
mv models/ ${ModelingHome}/DL4PropertyPrediction/
