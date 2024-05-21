vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/Aloatec/vcpkg-registry
    REF ec2c283e07ab32381e61c0c5d8df1c16b2ffb3ad
)

vcpkg_msbuild_install(
    SOURCE_PATH "${SOURCE_PATH}"
    PROJECT_SUBPATH "Ex2-AjoutPort/Ex2-AjoutPort.sln"
    TARGET ex2-ajoutport
    PLATFORM ${VCPKG_TARGET_ARCHITECTURE}
)

file(GLOB HEADER_FILES LIST_DIRECTORIES false "${SOURCE_PATH}/include/*.h")

file(INSTALL
    ${HEADER_FILES}
    DESTINATION "${CURRENT_PACKAGES_DIR}/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")