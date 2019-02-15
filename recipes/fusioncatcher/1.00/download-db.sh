#!/usr/bin/env bash

echo "Downloading Human Ensembl v90 database to ${FC_DB_PATH}/current/..."

# FC_DB_PATH is defined in build.sh, store db there

# This command downloads both data and tools:
# wget http://sf.net/projects/fusioncatcher/files/bootstrap.py -O bootstrap.py && python bootstrap.py --download -y -p ${FC_DB_PATH}

# This command fails, FTP Error = 550 gencode.v28.annotation.gtf.gz: No such file or directory:
# fusioncatcher-build -g homo_sapiens -o ${FC_DB_PATH}

# Direct download:
cd ${FC_DB_PATH}
rm -rf human_v90.tar.gz.*
wget http://sourceforge.net/projects/fusioncatcher/files/data/human_v90.tar.gz.aa
wget http://sourceforge.net/projects/fusioncatcher/files/data/human_v90.tar.gz.ab
wget http://sourceforge.net/projects/fusioncatcher/files/data/human_v90.tar.gz.ac
wget http://sourceforge.net/projects/fusioncatcher/files/data/human_v90.tar.gz.ad
cat human_v90.tar.gz.* | tar xz
ln -s human_v90 current

echo "Human Ensembl v90 database is downloaded."

exit 0
