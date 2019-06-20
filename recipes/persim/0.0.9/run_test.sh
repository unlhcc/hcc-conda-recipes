#!/bin/bash

echo "Testing persim import..."
export MPLBACKEND=Agg
$PYTHON -c 'import persim'
