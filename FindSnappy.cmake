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

Try to find Google snappy library
   
IMPORTED Targets
^^^^^^^^^^^^^^^^

This module defines :prop_tgt:`IMPORTED` target ``snappy::snappy``, if snappy has been found.

Result Variables
^^^^^^^^^^^^^^^^

This module defines the following variables:

::

  SNAPPY_INCLUDE_DIRS   - where to find snappy.h, etc.
  SNAPPY_LIBRARIES      - List of libraries when using snappy.
  SNAPPY_FOUND          - True if snappy found.


#]=======================================================================]


find_path( SNAPPY_INCLUDE_DIRS NAMES "snappy.h" )
find_library( SNAPPY_LIBRARY NAMES snappy )

set(SNAPPY_LIBRARIES ${SNAPPY_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args( snappy DEFAULT_MSG SNAPPY_INCLUDE_DIRS SNAPPY_LIBRARIES)

mark_as_advanced(SNAPPY_INCLUDE_DIRS SNAPPY_LIBRARIES SNAPPY_FOUND)

if(SNAPPY_FOUND)
    if(NOT TARGET snappy::snappy)
      add_library(snappy::snappy UNKNOWN IMPORTED)
      set_target_properties(snappy::snappy PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${SNAPPY_INCLUDE_DIRS}")

      set_property(TARGET snappy::snappy APPEND PROPERTY IMPORTED_LOCATION "${SNAPPY_LIBRARIES}")
    endif()
endif()

