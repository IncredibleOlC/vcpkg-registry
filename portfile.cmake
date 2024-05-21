vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/Aloatec/vcpkg-training
    REF 4a0167ba201c805255e544027dd274d04aa7677f
)

vcpkg_msbuild_install(
    SOURCE_PATH "${SOURCE_PATH}"
    PROJECT_SUBPATH "Ex2-AjoutPort/Ex2-AjoutPort.sln"
    TARGET Ex2-AjoutPort
    PLATFORM ${VCPKG_TARGET_ARCHITECTURE}
)

file(GLOB HEADER_FILES LIST_DIRECTORIES false "${SOURCE_PATH}/include/*.h")

file(INSTALL
    ${HEADER_FILES}
    DESTINATION "${CURRENT_PACKAGES_DIR}/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")