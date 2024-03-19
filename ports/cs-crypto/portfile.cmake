vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO copperspice/cs_crypto
    REF crypto-${VERSION}
    SHA512 d2e6c414d87622dfc957f79bf15e9c3b2fa577d18e8400cedd8146b9f4e29a88c5455162e84b268f9fa2e93686754fcfb86e680c65707dc572617acddd0ee746
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        botan   ENABLE_BOTAN
        openssl ENABLE_OPENSSL
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH cmake/CsCrypto)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)