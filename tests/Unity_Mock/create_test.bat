@echo off 
set test_name=%1
set maindir_name=test_%test_name%
set main_file=test_%test_name%.c
set runner_file=test_%test_name%_runner.c

echo Creating directories...
mkdir %maindir_name%
cd .\%maindir_name%

echo Creating files...
echo.>%main_file%
echo.>%runner_file%
echo.>CMakeLists.txt

echo #include "unity_fixture.h" >> %main_file%
echo #include "test_func_multiply.h" >> %main_file%
echo.>> %main_file%
echo TEST_GROUP(%test_name%); >> %main_file%
echo.>> %main_file%
echo TEST_SETUP(%test_name%) >> %main_file%
echo { >> %main_file%
echo.>> %main_file%
echo } >> %main_file%
echo.>> %main_file%
echo TEST_TEAR_DOWN(%test_name%) >> %main_file%
echo { >> %main_file%
echo.>> %main_file%
echo } >> %main_file%

echo #include "unity_fixture.h" > %runner_file%
echo.>> %runner_file%
echo TEST_GROUP_RUNNER(%test_name%) >> %runner_file%
echo { >> %runner_file%
echo.>> %runner_file%
echo } >> %runner_file%

echo # SET THE NAME OF DIRECTORY!!! >> CMakeLists.txt
echo set(MODULE_NAME "multiply") >> CMakeLists.txt
echo set(MODULE_NAME "multiply" PARENT_SCOPE) >> CMakeLists.txt
echo.>> CMakeLists.txt
echo # If you need to add mocks from mocks folder do so  >> CMakeLists.txt
echo set(SRC_FILES  >> CMakeLists.txt
echo     "test_${MODULE_NAME}.c" >> CMakeLists.txt
echo     "test_${MODULE_NAME}_runner.c" >> CMakeLists.txt
echo ) >> CMakeLists.txt
echo.>> CMakeLists.txt
echo add_library(${MODULE_NAME} STATIC ${SRC_FILES}) >> CMakeLists.txt
echo target_link_libraries(${MODULE_NAME} source_lib unity_lib) >> CMakeLists.txt