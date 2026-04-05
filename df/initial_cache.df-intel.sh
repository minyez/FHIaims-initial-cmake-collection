# Intel Compilers
BUILDDIR=""
if (($# > 0)); then
  BUILDDIR="$1"
fi

nproc=2

LABEL="df-intel"

INITIAL_CMAKE="initial_cache.$LABEL.cmake"
cat >"$INITIAL_CMAKE" <<EOF
set(CMAKE_Fortran_COMPILER "mpiifort" CACHE STRING "" FORCE)
set(CMAKE_Fortran_FLAGS "-O3 -ip -fp-model precise" CACHE STRING "" FORCE)
set(Fortran_MIN_FLAGS "-O0 -fp-model precise" CACHE STRING "" FORCE)
set(CMAKE_C_COMPILER "icc" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS "-O3 -ip -fp-model precise -std=gnu99" CACHE STRING "" FORCE)
set(CMAKE_CXX_COMPILER "icpc" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-O3 -ip -fp-model precise" CACHE STRING "" FORCE)
set(LIB_PATHS "\$ENV{MKLROOT}/lib/intel64" CACHE STRING "" FORCE)
set(LIBS "mkl_intel_lp64 mkl_sequential mkl_core mkl_blacs_intelmpi_lp64 mkl_scalapack_lp64" CACHE STRING "" FORCE)
set(USE_GREENX OFF CACHE BOOL "" FORCE)
set(USE_MPI ON CACHE BOOL "" FORCE)
set(USE_SCALAPACK ON CACHE BOOL "" FORCE)
set(USE_LIBXC ON CACHE BOOL "" FORCE)
set(USE_HDF5 OFF CACHE BOOL "" FORCE)
set(USE_RLSY ON CACHE BOOL "" FORCE)
set(ELPA2_KERNEL "AVX512" CACHE STRING "Change to AVX/AVX2/AVX512 if running on Intel processors" FORCE)
EOF

module purge
module load oneapi/2023.2

if [[ -n "$BUILDDIR" ]]; then
  mkdir -p "$BUILDDIR"
  cmake -C "$INITIAL_CMAKE" -B "$BUILDDIR"
  cmake --build "$BUILDDIR" -j $nproc
else
  echo "initial cache created as $INITIAL_CMAKE. Requirements"
  echo ""
  echo "  module load oneapi/2023.2"
fi
