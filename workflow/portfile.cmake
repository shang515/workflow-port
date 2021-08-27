vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sogou/workflow
    REF v0.9.7
    SHA512 4866d9cfe2d9ba30f2f7866819ee8f425b91082d7f86994c1194a6b4406e8ee99e22ce6b0bafeb22c5f098f7da30029fb6b12895c2ac45810d33c28d4bfad006
    HEAD_REF master
    PATCHES cmake.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()


file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

message("Installing done")