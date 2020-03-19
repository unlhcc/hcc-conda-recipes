#!/bin/bash

mkdir -p ${PREFIX}/bin

cp 1.1.0/* ${PREFIX}/bin

chmod +x ${PREFIX}/bin/bs
chmod +x ${PREFIX}/bin/bs-cp
