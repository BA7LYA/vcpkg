vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO qicosmos/cinatra
    REF v${VERSION}
    SHA512 f220b5de78ae69004d8ff96967ca088475c557eabebf65340b62fa322e81fe19ebae073a30d9bb5472a4f1cd2980fdb5aa0fc7379793dc719c9b32155c807aa6
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_WITH_LIBCXX=OFF
        -DBUILD_EXAMPLES=ON
        -DBUILD_BENCHMARK=ON
        -DBUILD_UNIT_TESTS=ON
        -DBUILD_PRESS_TOOL=ON
        -DCOVERAGE_TEST=ON
        -DENABLE_SANITIZER=ON
        -DENABLE_GZIP=OFF
        -DENABLE_SSL=OFF
        -DENABLE_CLIENT_SSL=OFF
        # SIMD
        # -DENABLE_SIMD=SSE42
        # -DENABLE_SIMD=AVX2
        # -DENABLE_SIMD=AARCH64

)

vcpkg_cmake_install()
# vcpkg_cmake_config_fixup(CONFIG_PATH cmake/CsLibGuarded)

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cmake")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# file(INSTALL
#     "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
# )