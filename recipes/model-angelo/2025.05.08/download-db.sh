#!/usr/bin/env bash

echo "Downloading model-angelo models to ${TORCH_HOME}..."

# TORCH_HOME is defined in build.sh, store the db there

cd ${TORCH_HOME}
model_angelo setup_weights --bundle-name nucleotides
model_angelo setup_weights --bundle-name nucleotides_no_seq

echo "model-angelo models are downloaded."

exit 0
