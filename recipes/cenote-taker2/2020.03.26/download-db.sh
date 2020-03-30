#!/usr/bin/env bash

echo "Downloading Cenote-Taker2 databases to ${CT2_DIR}..."

# CT2_DIR is defined in build.sh, store the db there

# download data from repo
# https://github.com/mtisza1/Cenote-Taker2/blob/master/install_scripts/cenote_install1.sh

echo "Downloading HMM databases..."
wget https://zenodo.org/record/3660539/files/hmmscan_DBs.tgz
tar -xvf hmmscan_DBs.tgz
rm hmmscan_DBs.tgz

echo "Downloading BLAST databases..."
wget https://zenodo.org/record/3660538/files/blast_DBs.tgz
tar -xvf blast_DBs.tgz
rm blast_DBs.tgz

echo "Downloading NCBI_CD hhsuite databases..."
wget https://zenodo.org/record/3660537/files/NCBI_CD_hhsuite.tgz
tar -xvf NCBI_CD_hhsuite.tgz
rm NCBI_CD_hhsuite.tgz

echo "Downloading pfam_32 hhsuite databases..."
mkdir pfam_32_db && cd pfam_32_db
wget http://wwwuser.gwdg.de/~compbiol/data/hhsuite/databases/hhsuite_dbs/pfamA_32.0.tar.gz
tar -xvf pfamA_32.0.tar.gz
rm pfamA_32.0.tar.gz
cd ..

echo "Downloading pdb70 hhsuite databases..."
mkdir pdb70 && cd pdb70
wget http://wwwuser.gwdg.de/~compbiol/data/hhsuite/databases/hhsuite_dbs/pdb70_from_mmcif_latest.tar.gz
tar -xvf pdb70_from_mmcif_latest.tar.gz
rm pdb70_from_mmcif_latest.tar.gz
cd ..

echo "Downloading RPSBLAST CDD databases..."
mkdir cdd_rps_db && cd cdd_rps_db
wget ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/little_endian/Cdd_LE.tar.gz
tar -xvf Cdd_LE.tar.gz
rm Cdd_LE.tar.gz
cd ..

echo "Cenote-Taker2 databases are downloaded."

exit 0
