#!/bin/bash

# linking is needed because of undefined symbol: shm_unlink error
LDFLAGS="${LDFLAGS} -Wl,--no-as-needed -lrt" python -m pip install . -vv
