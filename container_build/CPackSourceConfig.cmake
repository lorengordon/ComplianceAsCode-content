# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "/home/oscap/content;/home/oscap/content/build")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.22/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "scap-security-guide built using CMake")
set(CPACK_GENERATOR "TBZ2")
set(CPACK_IGNORE_FILES "\\.git.*;\\.pyc;__pycache__;build/;~$;\\CMakeLists.txt.user")
set(CPACK_INSTALLED_DIRECTORIES "/home/oscap/content;/")
set(CPACK_INSTALL_CMAKE_PROJECTS "")
set(CPACK_INSTALL_PREFIX "/usr/local")
set(CPACK_MODULE_PATH "/home/oscap/content/cmake")
set(CPACK_NSIS_DISPLAY_NAME "scap-security-guide 0.1.68")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "scap-security-guide 0.1.68")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "/home/oscap/content/build/CPackConfig.cmake")
set(CPACK_PACKAGE_CHECKSUM "SHA512")
set(CPACK_PACKAGE_CONTACT "open-scap-list@redhat.com")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.22/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Security guidance and baselines in SCAP formats")
set(CPACK_PACKAGE_FILE_NAME "scap-security-guide-0.1.68")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "scap-security-guide 0.1.68")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "scap-security-guide 0.1.68")
set(CPACK_PACKAGE_NAME "scap-security-guide")
set(CPACK_PACKAGE_RELOCATABLE "false")
set(CPACK_PACKAGE_VENDOR "scap-security-guide")
set(CPACK_PACKAGE_VERSION "0.1.68")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "1")
set(CPACK_RESOURCE_FILE_LICENSE "/usr/share/cmake-3.22/Templates/CPack.GenericLicense.txt")
set(CPACK_RESOURCE_FILE_README "/usr/share/cmake-3.22/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "/usr/share/cmake-3.22/Templates/CPack.GenericWelcome.txt")
set(CPACK_RPM_EXCLUDE_FROM_AUTO_FILELIST_ADDITION "/usr/share/xml;/usr/share/man;/usr/share/man/man8")
set(CPACK_RPM_FILE_NAME "%{name}-%{version}-%{release}.rpm")
set(CPACK_RPM_PACKAGE_ARCHITECTURE "noarch")
set(CPACK_RPM_PACKAGE_DESCRIPTION "The %{name} project provides a guide for configuration of the
system from the final system's security point of view. The guidance is
specified in the Security Content Automation Protocol (SCAP) format and
constitutes a catalog of practical hardening advice, linked to government
requirements where applicable. The project bridges the gap between generalized
policy requirements and specific implementation guidelines. The system
administrator can use the oscap command-line tool from the openscap-utils
package to verify that the system conforms to provided guidelines.
The %{name} package also contains HTML formatted documents containing
hardening guidances that have been generated from XCCDF benchmarks.
")
set(CPACK_RPM_PACKAGE_GROUP "Applications/System")
set(CPACK_RPM_PACKAGE_LICENSE "BSD-3-Clause")
set(CPACK_RPM_PACKAGE_PROVIDES "openscap-content")
set(CPACK_RPM_PACKAGE_RELEASE "1%{?dist}")
set(CPACK_RPM_PACKAGE_REQUIRES "xml-common, openscap-utils >= 1.0.8")
set(CPACK_RPM_PACKAGE_SOURCES "ON")
set(CPACK_RPM_PACKAGE_URL "https://www.open-scap.org/security-policies/scap-security-guide/")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TBZ2")
set(CPACK_SOURCE_IGNORE_FILES "\\.git.*;\\.pyc;__pycache__;build/;~$;\\CMakeLists.txt.user")
set(CPACK_SOURCE_INSTALLED_DIRECTORIES "/home/oscap/content;/")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/home/oscap/content/build/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "scap-security-guide-0.1.68")
set(CPACK_SOURCE_TOPLEVEL_TAG "Linux-Source")
set(CPACK_STRIP_FILES "")
set(CPACK_SYSTEM_NAME "Linux")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "Linux-Source")
set(CPACK_WIX_SIZEOF_VOID_P "")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/home/oscap/content/build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
