set(CMAKE_Fortran_COMPILER "mpifort" CACHE STRING "" FORCE)
# debug flags: -fcheck=all -fbacktrace
set(CMAKE_Fortran_FLAGS "-O3 -fallow-argument-mismatch -ffree-line-length-none -Wl,-lstdc++" CACHE STRING "" FORCE)
set(Fortran_MIN_FLAGS "-O0 -fallow-argument-mismatch -ffree-line-length-none" CACHE STRING "" FORCE)
set(CMAKE_C_COMPILER "mpicc" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS "-O3" CACHE STRING "" FORCE)
set(CMAKE_CXX_COMPILER "mpicxx" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-O3" CACHE STRING "" FORCE)
set(LIB_PATHS "/usr/lib64/mpich/lib" CACHE STRING "")
set(LIBS "scalapack openblas" CACHE STRING "" FORCE)
# for GreenX to use the same library
set(BLAS_LIBRARIES "-L/usr/lib64 -lopenblas" CACHE STRING "")
set(LAPACK_LIBRARIES "-L/usr/lib64 -lopenblas" CACHE STRING "")

set(USE_GREENX ON CACHE BOOL "" FORCE)
set(USE_MPI ON CACHE BOOL "" FORCE)
set(USE_SCALAPACK ON CACHE BOOL "" FORCE)
set(USE_LIBXC ON CACHE BOOL "" FORCE)
set(USE_HDF5 OFF CACHE BOOL "" FORCE)
set(USE_RLSY ON CACHE BOOL "" FORCE)
set(ELPA2_KERNEL "" CACHE STRING "Change to AVX/AVX2/AVX512 if running on Intel processors" FORCE)

set(USE_EXTERNAL_LIBRPA ON CACHE BOOL "" FORCE)
set(EXTERNAL_LIBRPA_BUILD_DIR "$ENV{HOME}/codes/LibRPA/build_develop_backup_before_soc_mpich_release" CACHE STRING "" FORCE)
