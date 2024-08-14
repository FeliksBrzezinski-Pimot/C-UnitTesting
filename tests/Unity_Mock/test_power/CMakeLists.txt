# SET THE NAME OF DIRECTORY!!!
set(MODULE_NAME "power")
set(MODULE_NAME "power" PARENT_SCOPE)

# If you need to add mocks from mocks folder do so 
set(SRC_FILES 
    "test_${MODULE_NAME}.c"
    "test_${MODULE_NAME}_runner.c"
)

add_library(${MODULE_NAME} STATIC ${SRC_FILES})
target_link_libraries(${MODULE_NAME} source_lib unity_lib)