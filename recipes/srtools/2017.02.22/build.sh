#!/bin/bash

# copy scripts
chmod +x bin/*.pl
cp bin/*.pl ${PREFIX}/bin/
chmod +x toolkit/*.pl
cp toolkit/*.pl ${PREFIX}/bin/

# copy library
mkdir -p ${PREFIX}/lib/5.26.2
cp lib/CommonFunctions.pm ${PREFIX}/lib/5.26.2/
