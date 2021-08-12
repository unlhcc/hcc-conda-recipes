#!/bin/bash

mkdir -p ${PREFIX}/bin/

# create executables
make CC=$CXX
cp *.out ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/*.out

# copy python scripts
cp *.py ${PREFIX}/bin/
chmod +x ${PREFIX}/bin/*.py

# copy folders and files needed for visualization
DATA_VIZ="${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}/aux_data"
mkdir -p "${DATA_VIZ}"
cp -r ./css ${DATA_VIZ}/
cp -r ./lib ${DATA_VIZ}/
cp logo.jpg ${DATA_VIZ}/
cp main.* ${DATA_VIZ}/

# set AUX_DATA variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/virhostmatcher.sh
export AUX_DATA=${DATA_VIZ}
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/virhostmatcher.sh
unset AUX_DATA
EOF
