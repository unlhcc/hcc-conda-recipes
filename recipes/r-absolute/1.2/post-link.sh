#!/usr/bin/env bash

cat <<EOF >> ${PREFIX}/.messages.txt

Please copy the "batch_exec_ABS.R" to your working project directory:
cp ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/scripts/batch_exec_ABS.R .
and modify the paths of "SIF_FN" and "obj.name" accordingly.

After the script is modified, you can launch it from R from your current working project directory:
source("batch_exec_ABS.R")

EOF
