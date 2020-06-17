#!/bin/bash

set -o errexit -o pipefail

mv DESCRIPTION DESCRIPTION.old
grep -va '^Priority: ' DESCRIPTION.old > DESCRIPTION
${R} CMD INSTALL --build .

# Remove OSX libs that break the build on linux
find ${PREFIX}/lib/R/library/INLA/bin -name '*.dylib' -exec rm '{}' \;
rm -rf ${PREFIX}/lib/R/library/INLA/bin/mac
