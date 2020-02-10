include(GNUInstallDirs)

if(NOT CPACK_GENERATOR)
    list(APPEND CPACK_GENERATOR TGZ)
endif()

set(CPACK_PACKAGING_INSTALL_PREFIX "")
include(CPack)