#!/usr/bin/env bash

echo "Downloading VirHostMatcher-Net database to ${VHMN_DATA}..."

# VHMN_DATA is defined in build.sh, store the db there

cd ${VHMN_DATA}

# the link for https://github.com/WeiliWw/VirHostMatcher-Net#complete-genome-mode-and-short-viral-contig-mode is broken
# so only the complete genome is downloaded
# https://github.com/WeiliWw/VirHostMatcher-Net#complete-genome-mode-alone
fileid="185U3ZLYe1uNmB5oCaIlb0IQNURnlyXcN"
filename="data_VirHostMatcher-Net_complete_genome_mode_alone.tar.gz"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
# extract
tar --strip-components=1 -zxf data_VirHostMatcher-Net_complete_genome_mode_alone.tar.gz
rm data_VirHostMatcher-Net_complete_genome_mode_alone.tar.gz

echo "VirHostMatcher-Net database is downloaded."

exit 0
