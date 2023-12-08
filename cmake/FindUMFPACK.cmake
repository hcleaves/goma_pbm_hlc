# Modified from Eigen library https://gitlab.com/libeigen/eigen See Eigen
# library for Copyright and Licensing of this file

if(UMFPACK_INCLUDES AND UMFPACK_LIBRARIES)
  set(UMFPACK_FIND_QUIETLY TRUE)
endif(UMFPACK_INCLUDES AND UMFPACK_LIBRARIES)

find_path(
  UMFPACK_INCLUDES
  NAMES umfpack.h
  PATHS ${UMFPACK_DIR}/include $ENV{UMFPACK_DIR}/include ${INCLUDE_INSTALL_DIR}
  PATH_SUFFIXES suitesparse ufsparse)

find_library(UMFPACK_LIBRARIES umfpack
             PATHS ${UMFPACK_DIR}/lib $ENV{UMFPACK_DIR}/lib ${LIB_INSTALL_DIR})

if(UMFPACK_LIBRARIES)

  if(NOT UMFPACK_LIBDIR)
    get_filename_component(UMFPACK_LIBDIR ${UMFPACK_LIBRARIES} PATH)
  endif(NOT UMFPACK_LIBDIR)

  find_library(COLAMD_LIBRARY colamd PATHS ${UMFPACK_LIBDIR} $ENV{UMFPACKDIR}
                                           ${LIB_INSTALL_DIR})
  if(COLAMD_LIBRARY)
    set(UMFPACK_LIBRARIES ${UMFPACK_LIBRARIES} ${COLAMD_LIBRARY})
  endif()

  find_library(AMD_LIBRARY amd PATHS ${UMFPACK_LIBDIR} $ENV{UMFPACKDIR}
                                     ${LIB_INSTALL_DIR})
  if(AMD_LIBRARY)
    set(UMFPACK_LIBRARIES ${UMFPACK_LIBRARIES} ${AMD_LIBRARY})
  endif()

  find_library(SUITESPARSE_LIBRARY SuiteSparse
               PATHS ${UMFPACK_LIBDIR} $ENV{UMFPACKDIR} ${LIB_INSTALL_DIR})
  if(SUITESPARSE_LIBRARY)
    set(UMFPACK_LIBRARIES ${UMFPACK_LIBRARIES} ${SUITESPARSE_LIBRARY})
  endif()

  find_library(CHOLMOD_LIBRARY cholmod
               PATHS $ENV{UMFPACK_LIBDIR} $ENV{UMFPACKDIR} ${LIB_INSTALL_DIR})
  if(CHOLMOD_LIBRARY)
    set(UMFPACK_LIBRARIES ${UMFPACK_LIBRARIES} ${CHOLMOD_LIBRARY})
  endif()

endif(UMFPACK_LIBRARIES)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(UMFPACK DEFAULT_MSG UMFPACK_INCLUDES
                                  UMFPACK_LIBRARIES)

mark_as_advanced(UMFPACK_INCLUDES UMFPACK_LIBRARIES AMD_LIBRARY COLAMD_LIBRARY
                 CHOLMOD_LIBRARY SUITESPARSE_LIBRARY)
