#!/usr/bin/env bash

# version: 2026-05-26 Tue
# aims: 3f0ca6c3f (260501)

module purge
module load compiler/devtoolset/11.2.1 compiler/cmake/3.24.1
module load intel/oneAPI-2021.3

initial_cache="initial_cache_aims_xdb_intel.cmake"

cat >"$initial_cache" <<EOF
# Intel Compilers
set(CMAKE_Fortran_COMPILER "mpiifort" CACHE STRING "" FORCE)
set(CMAKE_Fortran_FLAGS "-O3 -ip -fp-model precise" CACHE STRING "" FORCE)
set(Fortran_MIN_FLAGS "-O0 -fp-model precise" CACHE STRING "" FORCE)
set(CMAKE_C_COMPILER "icc" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS "-O3 -ip -fp-model precise -std=gnu99" CACHE STRING "" FORCE)
set(CMAKE_CXX_COMPILER "icpc" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-O3 -ip -fp-model precise" CACHE STRING "" FORCE)
set(LIB_PATHS "\$ENV{MKLROOT}/lib/intel64" CACHE STRING "" FORCE)
set(LIBS "mkl_intel_lp64 mkl_sequential mkl_core mkl_blacs_intelmpi_lp64 mkl_scalapack_lp64" CACHE STRING "" FORCE)
set(USE_GREENX ON CACHE BOOL "" FORCE)
set(USE_MPI ON CACHE BOOL "" FORCE)
set(USE_CALIPER OFF CACHE BOOL "" FORCE)
set(USE_SCALAPACK ON CACHE BOOL "" FORCE)
set(USE_LIBXC ON CACHE BOOL "" FORCE)
set(USE_HDF5 OFF CACHE BOOL "" FORCE)
set(USE_RLSY ON CACHE BOOL "" FORCE)
set(USE_DFTD3 OFF CACHE BOOL "" FORCE)
set(ELPA2_KERNEL "" CACHE STRING "Change to AVX/AVX2/AVX512 if running on Intel processors" FORCE)
EOF

BUILDDIR="build_intel"

cmake -B $BUILDDIR -C $initial_cache
# cmake --build $BUILDDIR -j4
