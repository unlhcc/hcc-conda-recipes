#!/usr/bin/env bash
set -euo pipefail

mkdir -p "${PREFIX}/share/metacompass-db"
mkdir -p "${PREFIX}/lib/metacompass"

ln -sfn "${PREFIX}/share/metacompass-db/RefSeq_V2_db" \
       "${PREFIX}/lib/metacompass/RefSeq_V2_db"

cat <<EOF >> "${PREFIX}/.messages.txt"

============================================================
 MetaCompass Database Setup
============================================================

MetaCompass requires the RefSeq reference database (~20GB).

To download and install the database, run:

    wget https://obj.umiacs.umd.edu/metacompass-db/RefSeq_V2_db.tar.gz
    tar -xzf RefSeq_V2_db.tar.gz -C ${PREFIX}/share/metacompass-db

After extraction, the database will be available at:
    ${PREFIX}/share/metacompass-db/RefSeq_V2_db

A symlink is also available at:
    ${PREFIX}/lib/metacompass/RefSeq_V2_db

If you already have the database, copy it directly into:
    ${PREFIX}/share/metacompass-db/RefSeq_V2_db

============================================================

EOF

