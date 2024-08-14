# ===================================
# CMake definitions
# ===================================
cmake_minimum_required(VERSION 3.30)
project(STARTER)

set(CMAKE_GENERATOR "MinGW Makefiles" CACHE INTERNAL "" FORCE)

# ===================================
# Path definitions
# ===================================
set(ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../..)

# Production
set(SRC ${ROOT}/src)
set(PROD_INC ${SRC}/include)
set(PROD_SRC ${SRC}/src)

# Unity 
set(UNITY_DIR ${ROOT}/tools/Unity)

set(UNITY_SRC ${UNITY_DIR}/src)

set(UNITY_MEMORY_SRC ${UNITY_DIR}/extras/memory/src)
set(UNITY_FIXTURE_SRC ${UNITY_DIR}/extras/fixture/src)

# FFF
set(FFF_DIR ${ROOT}/tools/FFF)

# Tests
set(BUILD ${ROOT}/build)
set(MOCKS_SRC ${ROOT}/mocks)
set(TEST_DIR ${ROOT}/tests/Unity_Mock)
set(TEST_SRC 
    ${TEST_DIR}/test_power 
    ${TEST_DIR}/test_multiply
    ${TEST_DIR}/test_sum
)

# ===================================
# Source file hunt
# ===================================
# Prodution
file(GLOB SRC_FILES ${PROD_SRC}/*.c)

# Unity
file(GLOB UNITY_SRC_FILES ${UNITY_SRC}/*.c)
file(GLOB UNITY_MEMORY_SRC_FILES ${UNITY_MEMORY_SRC}/*.c)
file(GLOB UNITY_FIXTURE_SRC_FILES ${UNITY_FIXTURE_SRC}/*.c)

# ===================================
# Libraries 
# ===================================

# First it is needed to build base libraries 
# Library from production files
add_library(source_lib SHARED ${SRC_FILES})
target_include_directories(source_lib PUBLIC ${PROD_INC})

# Library from unity files
add_library(unity_lib SHARED 
    ${UNITY_SRC_FILES} 
    ${UNITY_MEMORY_SRC_FILES} 
    ${UNITY_FIXTURE_SRC_FILES}
)
target_include_directories(unity_lib PUBLIC ${UNITY_SRC} 
    ${UNITY_MEMORY_SRC}
    ${UNITY_FIXTURE_SRC}
    ${FFF_DIR}
)

# Libraries from test folders
set(TEST_LIB "")

# ===================================
# Adding subdirectories 
# ===================================
foreach(DIR ${TEST_SRC})
    add_subdirectory(${DIR})
    list(APPEND TEST_LIB ${MODULE_NAME})
endforeach()

# ===================================
# Final linking
# ===================================
add_executable(AllTests  AllTests.c)
target_link_libraries(AllTests unity_lib)
target_link_libraries(AllTests ${TEST_LIB})