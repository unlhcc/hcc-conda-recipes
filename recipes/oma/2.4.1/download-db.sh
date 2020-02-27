#!/usr/bin/env bash

echo "Downloading OMA GO database file to ${OMADATA}..."

# Download database file
# OMA downloads the data the first time the program is run
# Since there is not different way to download the data, we uploaded the current version to Box
cd ${OMADATA}
wget https://unl.box.com/shared/static/cmsa0wjnx43a2btvjtkhc0lczcitmo8a.gz -O GOdata.drw-20200226.gz
ln -s GOdata.drw-20200226.gz GOdata.drw.gz
cd ~

echo "OMA GO database is downloaded."

exit 0
