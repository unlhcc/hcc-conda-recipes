#!/usr/bin/env bash

echo "Downloading METABOLIC test data in '${METABOLIC_DATA_DIR}'."

# METABOLIC_DATA_DIR is defined in build.sh, store the db there
echo "Downloading test data..."
gdown https://drive.google.com/uc?id=1JQJpw_elM4IyGo_BIfioy8XnmqgoN-Iw -O -  | tar -zx --overwrite -C ${METABOLIC_DATA_DIR}
echo "METABOLIC test data has been downloaded."

exit 0
