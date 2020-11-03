# The following lines of boilerplate have to be in your project's
# CMakeLists in this exact order for cmake to work correctly
cmake_minimum_required(VERSION 3.5)

if(IDF_TARGET STREQUAL "esp32")
    set(EXTRA_COMPONENT_DIRS ${CMAKE_SOURCE_DIR}/components/esp-rainmaker/components)
endif()

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
project(arduino-lib-builder)

add_custom_command(
	OUTPUT out 
	COMMAND ${CMAKE_SOURCE_DIR}/tools/prepare-libs.sh ${IDF_TARGET}
	DEPENDS ${CMAKE_PROJECT_NAME}.elf gen_project_binary bootloader partition_table 
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)
add_custom_target(idf-libs ALL DEPENDS out)
