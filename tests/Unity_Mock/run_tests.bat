@echo off
if exist .\build\ (
    call:run_cmake
) else (
    mkdir build
    call:run_cmake
)

:run_cmake
cmake -S . -B .\build\ -G "MinGW Makefiles"
cmake --build .\build\

if exist ".\build\AllTests.exe" (
    echo =======================================
    echo             Running tests
    echo =======================================
    cd .\build
    .\AllTests.exe
    echo =======================================
) else (
    echo Couldn't find final build file :(
)
goto :eof