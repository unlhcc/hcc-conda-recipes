#!/usr/bin/env bash

echo "Downloading and processing profile database in '${METABOLIC_DATA_DIR}/kofam_database/profiles'."

# METABOLIC_DATA_DIR is defined in build.sh, store the db there
echo "Downloading profile archive file..."
curl -#SLf --retry 3 ftp://ftp.genome.jp/pub/db/kofam/profiles.tar.gz  | tar -zx --overwrite -C ${METABOLIC_DATA_DIR}/kofam_database
echo "Processing database files..."
pushd ${METABOLIC_DATA_DIR}/kofam_database/profiles > /dev/null
batch_hmmpress.pl

echo "Profile database has been downloaded and processed."

exit 0
