vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BA7LYA/cs_paint
    # REF paint-${VERSION}
    REF dec13698bbe05a06cf559a4a9146ffa62ddb05cc
    SHA512 217e2bc2e587fe2e0c3ecc71685fe31528b66dfb7d4c3df5e9b21ff70cca2500afbbae6563d9766b9851d11f7d5d5b36f69a75b8db300e4c2f9911d446c1721b
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DGLM_TEST_ENABLE_CXX_17=ON
        -DGLM_TEST_ENABLE=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/glm)
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)