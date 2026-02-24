#!/bin/bash
set -e

echo "Patching GAPIT DESCRIPTION to version 3.5.0..."
sed -i 's/^Version:.*/Version: 3.5.0/' $SRC_DIR/DESCRIPTION


echo "Installing GAPIT"

$R CMD INSTALL --build .
echo "Done."
