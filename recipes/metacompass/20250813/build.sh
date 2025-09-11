#!/bin/bash
set -euo pipefail

PKG_DIR="${PREFIX}/lib/metacompass"
BIN_DIR="${PREFIX}/bin"
SRC_TOP="${SRC_DIR}/MetaCompass"
WORKFLOW_DIR="${PKG_DIR}/workflows"

mkdir -p "${PKG_DIR}" "${BIN_DIR}"
cp -a "${SRC_TOP}/." "${PKG_DIR}/"

chmod +x "${WORKFLOW_DIR}"/*.py

ln -s "${WORKFLOW_DIR}/assembly.py"           "${BIN_DIR}/assembly.py"
ln -s "${WORKFLOW_DIR}/clean.py"              "${BIN_DIR}/clean.py"
ln -s "${WORKFLOW_DIR}/go_metacompass.py"     "${BIN_DIR}/go_metacompass.py"
ln -s "${WORKFLOW_DIR}/go_metacompass_ref.py" "${BIN_DIR}/go_metacompass_ref.py"
ln -s "${WORKFLOW_DIR}/pilon-megahit.py"      "${BIN_DIR}/pilon-megahit.py"
ln -s "${WORKFLOW_DIR}/pilon_paired.py"       "${BIN_DIR}/pilon_paired.py"
ln -s "${WORKFLOW_DIR}/reference.py"          "${BIN_DIR}/reference.py"
ln -s "${WORKFLOW_DIR}/assembly_stats.py"     "${BIN_DIR}/assembly_stats.py"
ln -s "${WORKFLOW_DIR}/contigs.py"            "${BIN_DIR}/contigs.py"
ln -s "${WORKFLOW_DIR}/go_metacompass2.py"    "${BIN_DIR}/go_metacompass2.py"
ln -s "${WORKFLOW_DIR}/mash_filter.py"        "${BIN_DIR}/mash_filter.py"
ln -s "${WORKFLOW_DIR}/pilon.py"              "${BIN_DIR}/pilon.py"
ln -s "${WORKFLOW_DIR}/pilon_unpaired.py"     "${BIN_DIR}/pilon_unpaired.py"
ln -s "${WORKFLOW_DIR}/reference_selection.py" "${BIN_DIR}/reference_selection.py"
ln -s "${WORKFLOW_DIR}/assembly_validation.py" "${BIN_DIR}/assembly_validation.py"
ln -s "${WORKFLOW_DIR}/contigs2.py"           "${BIN_DIR}/contigs2.py"
ln -s "${WORKFLOW_DIR}/go_metacompass_noclean.py" "${BIN_DIR}/go_metacompass_noclean.py"
ln -s "${WORKFLOW_DIR}/metaphyler_selection.py"   "${BIN_DIR}/metaphyler_selection.py"
ln -s "${WORKFLOW_DIR}/pilon_contigs.py"      "${BIN_DIR}/pilon_contigs.py"
ln -s "${WORKFLOW_DIR}/prepare_correction.py" "${BIN_DIR}/prepare_correction.py"
ln -s "${WORKFLOW_DIR}/select_references.py"  "${BIN_DIR}/select_references.py"

ln -sfn "${PKG_DIR}" "${BIN_DIR}/"

install -m 0755 "${SRC_DIR}/kmer-mask" "${BIN_DIR}/kmer-mask"
