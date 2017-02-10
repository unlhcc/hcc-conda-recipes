#!/bin/bash

g++ -I${PREFIX}/include -L${PREFIX}/lib -lisl -lgmp test.cpp
./a.out
