project(myapp)
cmake_minimum_required(VERSION 2.8)
SET(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} "/home/rootroot/newworkspace/mylib/install")
find_package(mylib REQUIRED)
add_executable(${PROJECT_NAME} myapp.c)
target_link_libraries(${PROJECT_NAME} mylib::mylib)

