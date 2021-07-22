project(myapp)
cmake_minimum_required(VERSION 2.8)
SET(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} "${PROJECT_SOURCE_DIR}/../mylib/install")
find_package(mylib REQUIRED)
add_executable(${PROJECT_NAME} myapp.c)
target_link_libraries(${PROJECT_NAME} myhellolib::mylib)

