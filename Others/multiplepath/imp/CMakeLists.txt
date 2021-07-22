cmake_minimum_required (VERSION 2.8)

# 项目信息
project (main)

add_subdirectory(world)
add_subdirectory(hello)
add_subdirectory(hello_world)

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(./ DIR_SRCS)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/hello_world/inc)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/common/inc)

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/world)

add_executable(main ${DIR_SRCS})
target_link_libraries (main hello_world)


