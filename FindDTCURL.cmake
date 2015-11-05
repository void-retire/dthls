# - Find dtcurl
# Find the native DTCURL headers and libraries.
#
#  DTCURL_INCLUDE_DIRS - where to find dtcurl/dtcurl_api.h, etc.
#  DTCURL_LIBRARIES    - List of libraries when using dtcurl.
#  DTCURL_FOUND        - True if dtcurl found.

# Look for the header file.
FIND_PATH(DTCURL_INCLUDE_DIR dtcurl/dtcurl_api.h
  $ENV{INCLUDE}
  "$ENV{LIB_DIR}/include"
  /usr/local/include
  /usr/include
  #mingw
  c:/msys/local/include
  NO_DEFAULT_PATH
  )

MARK_AS_ADVANCED(DTCURL_INCLUDE_DIR)

# Look for the library.
FIND_LIBRARY(DTCURL_LIBRARY NAMES dtcurl libdtcurl_imp PATHS
  $ENV{LIB}
  "$ENV{LIB_DIR}/lib"
  /usr/local/lib
  /usr/lib
  c:/msys/local/lib
  NO_DEFAULT_PATH
  )

MARK_AS_ADVANCED(DTCURL_LIBRARY)

IF(DTCURL_INCLUDE_DIR)
  MESSAGE(STATUS "dtcurl include was found")
ENDIF(DTCURL_INCLUDE_DIR)
IF(DTCURL_LIBRARY)
  MESSAGE(STATUS "dtcurl lib was found")
ENDIF(DTCURL_LIBRARY)

# Copy the results to the output variables.
IF(DTCURL_INCLUDE_DIR AND DTCURL_LIBRARY)
  SET(DTCURL_FOUND 1)
  SET(DTCURL_LIBRARIES ${DTCURL_LIBRARY})
  SET(DTCURL_INCLUDE_DIRS ${DTCURL_INCLUDE_DIR})
ELSE(DTCURL_INCLUDE_DIR AND DTCURL_LIBRARY)
  SET(DTCURL_FOUND 0)
  SET(DTCURL_LIBRARIES)
  SET(DTCURL_INCLUDE_DIRS)
ENDIF(DTCURL_INCLUDE_DIR AND DTCURL_LIBRARY)

# Report the results.
IF(DTCURL_FOUND)
   IF (NOT DTCURL_FIND_QUIETLY)
      MESSAGE(STATUS "Found DTCURL: ${DTCURL_LIBRARY}")
   ENDIF (NOT DTCURL_FIND_QUIETLY)
ELSE(DTCURL_FOUND)
  SET(DTCURL_DIR_MESSAGE "DTCURL was not found.")

  IF(DTCURL_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "${DTCURL_DIR_MESSAGE}")
  ELSE(DTCURL_FIND_REQUIRED)
    IF(NOT DTCURL_FIND_QUIETLY)
      MESSAGE(STATUS "${DTCURL_DIR_MESSAGE}")
    ENDIF(NOT DTCURL_FIND_QUIETLY)
    # Avoid cmake complaints if DTCURL is not found
    SET(DTCURL_INCLUDE_DIR "")
    SET(DTCURL_LIBRARY "")
  ENDIF(DTCURL_FIND_REQUIRED)

ENDIF(DTCURL_FOUND)
