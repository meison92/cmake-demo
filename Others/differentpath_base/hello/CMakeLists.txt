cmake_minimum_required (VERSION 2.8)

# 项目信息
project (hello)

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

include_directories(${main_SOURCE_DIR}/world)

add_library(${PROJECT_NAME} SHARED ${DIR_SRCS})
target_link_libraries(${PROJECT_NAME} world)


