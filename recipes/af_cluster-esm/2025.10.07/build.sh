#!/bin/bash
set -euxo pipefail
 
# Upstream ships no setup.py/pyproject.toml, so pip install is impossible.
mkdir -p "${PREFIX}/bin"
 
# utils.py is NOT copied here -- af_cluster owns it, and duplicating it would
# create a file conflict between the two packages.
cd "${SRC_DIR}/af_cluster/scripts"
cp runESM.py "${PREFIX}/bin/"
 
sed -i "1i #!/usr/bin/env python" "${PREFIX}/bin/runESM.py"
chmod +x "${PREFIX}/bin/runESM.py"
