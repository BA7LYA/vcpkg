vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO copperspice/cs_pointer
    REF pointer-${VERSION}
    SHA512 960705a941837e76d1aadd85d7dd40ad9db640116fee0e9cd43efdef41af16cb90f8b5013b37e5bd955eb3ead1c85f05a08a8c4a445c66e4b3b28bbb71f46c8e
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTS=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH cmake/CsPointer)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)