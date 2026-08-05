#!/bin/bash
set -euxo pipefail

mkdir -p "${PREFIX}/bin"

cd "${SRC_DIR}/scripts"
cp ClusterMSA.py CalculateModelFeatures.py get_PCA_embedding.py \
   RunAF2.py runESM.py utils.py "${PREFIX}/bin/"

for i in ClusterMSA CalculateModelFeatures get_PCA_embedding RunAF2 runESM; do
  chmod +x "${PREFIX}/bin/${i}.py"
done
