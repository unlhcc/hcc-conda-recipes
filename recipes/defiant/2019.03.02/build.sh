#!/bin/bash

unzip defiant.zip

# Compile binaries
gcc -O4 -o defiant defiant.c -Wall -pedantic -std=gnu11 -lm -fopenmp
mv regions_of_interest regions_of_interest.c
gcc -o roi regions_of_interest.c -lm -Wall -std=gnu11 -Wextra -pedantic -Wconversion

# Copy binaries
cp defiant ${PREFIX}/bin
cp roi ${PREFIX}/bin
