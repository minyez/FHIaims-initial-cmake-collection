set(CMAKE_Fortran_COMPILER "mpifort" CACHE STRING "" FORCE)
# debug flags: -fcheck=all -fbacktrace
set(CMAKE_Fortran_FLAGS "-O3 -fallow-argument-mismatch -ffree-line-length-none -Wl,-ld_classic -Wl,-lstdc++" CACHE STRING "" FORCE)
set(Fortran_MIN_FLAGS "-O0 -fallow-argument-mismatch -ffree-line-length-none -Wl,-ld_classic" CACHE STRING "" FORCE)
set(CMAKE_C_COMPILER "mpicc" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS "-cc=gcc-14 -O3 -Wl,-ld_classic" CACHE STRING "" FORCE)
set(CMAKE_CXX_COMPILER "mpicxx" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-cxx=g++-14 -O3 -Wl,-ld_classic" CACHE STRING "" FORCE)
set(LIB_PATHS "/opt/packages/scalapack/2.2.0/gcc-14.2.0_1-mpich-4.2.3-openblas /opt/homebrew/Cellar/openblas/0.3.28/lib" CACHE STRING "")
set(LIBS "scalapack openblas" CACHE STRING "" FORCE)
# for GreenX to use the same library
set(BLAS_LIBRARIES "-L/opt/homebrew/Cellar/openblas/0.3.28/lib -lblas" CACHE STRING "")
set(LAPACK_LIBRARIES "-L/opt/homebrew/Cellar/openblas/0.3.28/lib -llapack" CACHE STRING "")

set(USE_GREENX ON CACHE BOOL "" FORCE)
set(USE_MPI ON CACHE BOOL "" FORCE)
set(USE_SCALAPACK ON CACHE BOOL "" FORCE)
set(USE_LIBXC ON CACHE BOOL "" FORCE)
set(USE_HDF5 OFF CACHE BOOL "" FORCE)
set(USE_RLSY ON CACHE BOOL "" FORCE)
set(ELPA2_KERNEL "" CACHE STRING "Change to AVX/AVX2/AVX512 if running on Intel processors" FORCE)
