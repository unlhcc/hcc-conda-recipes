#!/usr/bin/env bash

echo "Downloading VIGOR database to ${VIGOR_DB}..."

# VIGOR_DB is defined in build.sh, store the db there

cd ${VIGOR_DB}
wget ${DOWNLOAD_URL} -O VIGOR_DB.tar.gz
mkdir -p vigor_db
tar xf VIGOR_DB.tar.gz -C vigor_db --strip-components 1
cp -r vigor_db/Reference_DBs/* ${VIGOR_DB}/
rm -rf vigor_db
rm VIGOR_DB.tar.gz

echo "VIGOR database is downloaded."

exit 0
