
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Starfield-Reverse-Engineering/CommonLibSF
  REF 89da8fbdfe9f25cfc5884d530a466c6da819fb9c
  SHA512 0AC2CC5DB11AC5E832D80EF08C30B22E0BB53019922211F7DBFF3A61B1D22608A97DF33AAE641FE69D2B52EB4C513FAAA0477F4F71191AC24042628C27A570A9
  HEAD_REF main)
 
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(
  PACKAGE_NAME CommonLibSF 
  CONFIG_PATH lib/cmake)
vcpkg_copy_pdbs()

file(GLOB CMAKE_CONFIGS "${CURRENT_PACKAGES_DIR}/share/CommonLibSF/CommonLibSF/*.cmake")
file(INSTALL ${CMAKE_CONFIGS} DESTINATION "${CURRENT_PACKAGES_DIR}/share/CommonLibSF")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/CommonLibSF/CommonLibSF")

file(
  INSTALL "${SOURCE_PATH}/COPYING"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
