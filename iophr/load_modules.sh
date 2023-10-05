#!/bin/sh

HOST=$(hostname)
if [ "${HOST##mgmt}" != "${HOST}" ]; then
  echo "mgmt (IOPHR) detected"
  module load intel20u4
fi
