#!/usr/bin/env bash

cat <<EOF >> ${PREFIX}/.messages.txt


Please run 'download-metabolic-profiles.sh' to download the required profiles database files to ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/kofam_databaes/profiles. The downloaded and processed files require approximately 13GB.
If you have the database files already downloaded, copy them to that location instead.

If you also wish to download the METABOLIC test data, please run 'download-metabolic-testdata.sh' to save the data to ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/METABOLIC_test_files. The downloaded files require approximately 5.3GB.

EOF
