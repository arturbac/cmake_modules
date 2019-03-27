#[=======================================================================[.rst:
 
MIT License

Copyright (c) 2019 Artur Bac

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Artur Bac 2019

Try to find Facebook zstd library
   
IMPORTED Targets
^^^^^^^^^^^^^^^^

This module defines :prop_tgt:`IMPORTED` target ``zstd::zstd``, if zstd has been found.

Result Variables
^^^^^^^^^^^^^^^^

This module defines the following variables:

::

  ZSTD_INCLUDE_DIRS   - where to find zstd.h, etc.
  ZSTD_LIBRARIES      - List of libraries when using zstd.
  ZSTD_FOUND          - True if zstd found.


#]=======================================================================]

find_path( ZSTD_INCLUDE_DIRS NAMES "zstd.h" )

find_library( ZSTD_LIBRARY NAMES zstd )

set(ZSTD_LIBRARIES ${ZSTD_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args( ZSTD DEFAULT_MSG ZSTD_INCLUDE_DIRS ZSTD_LIBRARIES)

mark_as_advanced(ZSTD_INCLUDE_DIRS ZSTD_LIBRARIES ZSTD_FOUND)

if(ZSTD_FOUND)
    if(NOT TARGET zstd::zstd)
      add_library(zstd::zstd UNKNOWN IMPORTED)
      set_target_properties(zstd::zstd PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${ZLIB_INCLUDE_DIRS}")

      set_property(TARGET zstd::zstd APPEND PROPERTY IMPORTED_LOCATION "${ZSTD_LIBRARIES}")
    endif()
endif()
