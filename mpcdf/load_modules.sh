#!/bin/sh

HOST=$(hostname)
# For cobra/raven using Intel CPU and Nvidia GPU
if [ "${HOST##cobra}" != "${HOST}" ] || [ "${HOST##raven}" != "${HOST}" ]; then
  echo "Cobra/Raven detected"
  module load intel/2023.1.0.x  impi/2021.9 mkl/2023.1 cuda/12.1
fi
