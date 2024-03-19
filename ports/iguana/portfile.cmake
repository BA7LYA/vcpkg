vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO qicosmos/iguana
    REF v${VERSION}
    SHA512 f220b5de78ae69004d8ff96967ca088475c557eabebf65340b62fa322e81fe19ebae073a30d9bb5472a4f1cd2980fdb5aa0fc7379793dc719c9b32155c807aa6
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DLINKLIBC++=OFF
        -DENABLE_SEQUENTIAL_PARSE=OFF
        -DHAS_RAPIDJSON=OFF
        -DHAS_RAPIDYAML=OFF
        -DBUILD_UNIT_TESTS=ON
        -DCOVERAGE_TEST=OFF
)

vcpkg_cmake_install()
# vcpkg_cmake_config_fixup(CONFIG_PATH cmake/CsLibGuarded)

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cmake")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# file(INSTALL
#     "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
# )