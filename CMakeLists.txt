cmake_minimum_required(VERSION 3.10)
project(llhttp VERSION 2.0.5)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(macros)
include(packaging)

set(llhttp_public_header
    ${CMAKE_CURRENT_SOURCE_DIR}/llhttp/include/llhttp.h
)

set(llhttp_src
    ${CMAKE_CURRENT_SOURCE_DIR}/llhttp/src/api.c
    ${CMAKE_CURRENT_SOURCE_DIR}/llhttp/src/http.c
    ${CMAKE_CURRENT_SOURCE_DIR}/llhttp/src/llhttp.c
)

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/llhttp.pc.in
    ${CMAKE_CURRENT_SOURCE_DIR}/llhttp.pc
)

function(config_library target)
    target_include_directories(${target} PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/llhttp/include
    )

    set_target_properties(${target} PROPERTIES
        OUTPUT_NAME llhttp
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        PUBLIC_HEADER ${llhttp_public_header}
    )

    install(TARGETS ${target}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    )

    install(FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/llhttp.pc
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
    )
endfunction(config_library target)

if(BUILD_SHARED_LIBS)
    add_library(llhttp_shared SHARED
        ${llhttp_src}
    )
    config_library(llhttp_shared)
endif()

if(BUILD_STATIC_LIBS)
    add_library(llhttp_static STATIC
        ${llhttp_src}
    )
    config_library(llhttp_static)
endif()

