#!/bin/bash
set -euxo pipefail

${PYTHON} -m pip install "${SRC_DIR}/alphafold_colabfold" \
    --no-deps --no-build-isolation -vv

mkdir -p "${PREFIX}/bin"

cd "${SRC_DIR}/af_cluster/scripts"
cp ClusterMSA.py CalculateModelFeatures.py get_PCA_embedding.py \
   RunAF2.py runESM.py utils.py "${PREFIX}/bin/"

for _s in ClusterMSA CalculateModelFeatures get_PCA_embedding RunAF2 runESM; do
  chmod +x "${PREFIX}/bin/${_s}.py"
done
