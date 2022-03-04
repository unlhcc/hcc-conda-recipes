#!/bin/bash

echo "
You must agree to the license before using aspera-cli, http://www-03.ibm.com/software/sla/sladb.nsf/displaylis/2ABD3328689EBBFE8525830C007A5F38.
" >> $PREFIX/.messages.txt
printf '%s\n' "${URLS[@]}" >> "${PREFIX}/.messages.txt" 2>&1
