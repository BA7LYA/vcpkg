# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/winapi
    REF boost-${VERSION}
    SHA512 f0d04dcdcb930f88ec47f6580bce94258bac492e885422eb67ed2d9980d066cc46f969bd6aac29687fcc3f98a252b872df5dadfb1db19fe61cb1ddbacb70f925
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
