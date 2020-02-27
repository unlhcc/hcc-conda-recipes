#!/usr/bin/env bash

cat <<EOF >> ${PREFIX}/.messages.txt

Please run download-db.sh to download the required OMA GO database file to "$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/data/".
The date of the download is 02/26/2020.

EOF
