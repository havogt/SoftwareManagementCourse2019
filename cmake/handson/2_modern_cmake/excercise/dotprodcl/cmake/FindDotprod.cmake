#[=======================================================================[.rst:
FindDotprod
-----------

Find the dotprod library.

Imported targets
^^^^^^^^^^^^^^^^

This module defines the following :prop_tgt:`IMPORTED` targets:

``dotprod::Dotprod``
The dotprod library, if found.

Result variables
^^^^^^^^^^^^^^^^

This module will set the following variables in your project:

``Dotprod_FOUND``
true if the dotprod headers and libraries were found


#]=======================================================================]

if(NOT(DEFINED DOTPROD_ROOT))
    find_path(DOTPROD_ROOT NAMES include/dotprod/dotprod.h
        PATHS
            ${Dotprod_DIR}
            $ENV{Dotprod_DIR}
            $ENV{DOTPROD_ROOT}
        )
endif()

find_library(_dotprod_lib
    NAMES dotprod
    HINTS
        ${DOTPROD_ROOT}/lib64
        ${DOTPROD_ROOT}/lib
    )

find_path(_dotprod_include_dir
    NAMES dotprod/dotprod.h
    HINTS ${DOTPROD_ROOT}/include
    )

if(_dotprod_lib)
    if(NOT TARGET dotprod::Dotprod)
        if(NOT Dotprod_FIND_QUIETLY)
            message(STATUS "Found Dotprod!")
        endif()
        add_library(dotprod::Dotprod INTERFACE IMPORTED)
        target_include_directories(dotprod::Dotprod INTERFACE ${_dotprod_include_dir})
        target_link_libraries(dotprod::Dotprod INTERFACE ${_dotprod_lib})
        set(Dotprod_FOUND TRUE)
    endif()
else()
    if(Dotprod_FIND_REQUIRED)
        message(FATAL_ERROR "Required library Dotprod was not found!")
    else()
        if(NOT Dotprod_FIND_QUIETLY)
            message("Library Dotprod was not found!")
        endif()
    endif()
    unset(Dotprod_FOUND)
endif()