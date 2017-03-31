#!/bin/bash

ant dist
cp -R dist/pegasus-4.7.4/{bin,etc,lib,share} ${PREFIX}
