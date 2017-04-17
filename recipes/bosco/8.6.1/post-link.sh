#!/bin/bash

GID=`id -g $USER`
sed -i s/99.99/${UID}.${GID}/g ${PREFIX}/etc/condor_config
