cmake_minimum_required (VERSION 2.8)

# 项目信息
project (main)

add_subdirectory(world)
add_subdirectory(hello)

aux_source_directory(. DIR_SRCS)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/hello)

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/world)
add_executable(main ${DIR_SRCS})
# 因为使用了add_subdirectory内部都是直接target_link，会继承过来，所有这里会主动添加这两个库
target_link_libraries (main hello)


