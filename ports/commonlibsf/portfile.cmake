vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Starfield-Reverse-Engineering/CommonLibSF
  REF beccc06cc40cee28c304183b2676ff00e4278aa4
  SHA512 6b2616a3d5fc1493b70c54d1edea5609f46318939084ffe1f9f0cedad2acf1077ee6721ac841b53db154749931b43f24213cc8b1cc8b65c3a9e7bdcc4e0de11b
  HEAD_REF main)

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(PACKAGE_NAME CommonLibSF CONFIG_PATH lib/cmake)
vcpkg_copy_pdbs()

file(GLOB CMAKE_CONFIGS "${CURRENT_PACKAGES_DIR}/share/CommonLibSF/CommonLibSF/*.cmake")
file(INSTALL ${CMAKE_CONFIGS} DESTINATION "${CURRENT_PACKAGES_DIR}/share/CommonLibSF")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/CommonLibSF/CommonLibSF")

file(
        INSTALL "${SOURCE_PATH}/COPYING"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)
