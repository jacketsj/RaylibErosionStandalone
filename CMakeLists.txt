cmake_minimum_required(VERSION 3.5)

project(erosion LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED true)

set(SRC ${CMAKE_SOURCE_DIR}/src)
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
include_directories("${SRC}")
set(CMAKE_CXX_FLAGS "-Wall -pthread -O3")
option(BUILD_EXAMPLES "Build the examples." OFF)
option(BUILD_GAMES "Build the example games." OFF)
option(SUPPORT_GIF_RECORDING "Allow automatic gif recording of current screen pressing CTRL+F12, defined in KeyCallback()" OFF)
option(SUPPORT_EVENTS_WAITING "Wait for events passively (sleeping while no events) instead of polling them actively every frame" OFF)


find_package(Threads)
find_package(X11)
#find_package(raylib CONFIG REQUIRED)
#find_package(raylib)
#add_library(raylib SHARED polygame.cpp)
#add_library(GL SHARED polygame.cpp)
#add_library(m SHARED polygame.cpp)
#add_library(pthread SHARED polygame.cpp)
#add_library(dl SHARED polygame.cpp)
#add_library(rt SHARED polygame.cpp)
#add_library(X11 SHARED polygame.cpp)


add_executable(demo ${SRC}/Main.cpp ${SRC}/ErosionMaker.cpp)

#target_link_libraries(polygame X11)
add_subdirectory("raylib" raylib)
target_link_libraries(demo PUBLIC raylib)
#target_link_libraries(polygame GL)
#target_link_libraries(polygame m)
#target_link_libraries(polygame pthread)
#target_link_libraries(polygame dl)
#target_link_libraries(polygame rt)
target_include_directories(demo PRIVATE ${RAYLIB_INCLUDE_DIRS})
target_link_libraries(demo PRIVATE ${RAYLIB_LIBRARIES})
