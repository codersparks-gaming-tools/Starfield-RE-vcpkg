
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Starfield-Reverse-Engineering/CommonLibSF
  REF be15782d95b07a75ff0cae31ac6a4887ad318650
  SHA512 0B052BE3B2D129994A23D0044787B4B771B724B04654AAE578F1DD6AEE92D7A78B36E3595683E8788256F67EFFEC5D94DCF69C479531BE5B1966F049572B6FAC
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
