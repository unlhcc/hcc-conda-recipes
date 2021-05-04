#!/usr/bin/env bash

cat <<EOF >> ${PREFIX}/.messages.txt

Please run download-db.sh to download all required Cenote-Taker2 database files to ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/db/.
If you have the database files already downloaded, set CT2_DIR to point to the root download directory.
Please download the database files needed for Krona in ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/db/ or symlink them to this directory if they are already downloaded.

EOF
