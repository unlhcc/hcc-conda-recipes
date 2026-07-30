#!/bin/bash
set -euxo pipefail

mkdir -p "${PREFIX}/bin"

# RunAF2.py and runESM.py are not installed here; they ship in the
# af_cluster-af2 and af_cluster-esm packages, which can satisfy their deps.
cd "${SRC_DIR}/af_cluster/scripts"
cp ClusterMSA.py CalculateModelFeatures.py get_PCA_embedding.py utils.py "${PREFIX}/bin/"

for _s in ClusterMSA CalculateModelFeatures get_PCA_embedding; do
  sed -i "1i #!/usr/bin/env python" "${PREFIX}/bin/${_s}.py"
  chmod +x "${PREFIX}/bin/${_s}.py"
done
