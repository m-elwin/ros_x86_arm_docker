cmake_minimum_required(VERSION 3.0)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)


set(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc CACHE STRING "The C compiler")

set(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++ CACHE STRING "The C++ compiler") 

# only find programs on the host
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# only find library and include directories that are for the embedded system
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

