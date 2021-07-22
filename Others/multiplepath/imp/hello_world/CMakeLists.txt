cmake_minimum_required (VERSION 2.8)

# 项目信息
project (hello_world)

aux_source_directory(./src DIR_SRCS)

# 添加头文件路径,相当于添加 -I
include_directories(${main_SOURCE_DIR}/hello/inc)
include_directories(${main_SOURCE_DIR}/common/inc)

add_library(${PROJECT_NAME} SHARED ${DIR_SRCS})
target_link_libraries (${PROJECT_NAME} hello)


