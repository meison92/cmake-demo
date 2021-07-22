cmake_minimum_required (VERSION 2.8)

# 项目信息
project (world)

aux_source_directory(. DIR_SRCS)

message(main_SOURCE_DIR_is_${main_SOURCE_DIR})

add_library(${PROJECT_NAME} SHARED ${DIR_SRCS})


