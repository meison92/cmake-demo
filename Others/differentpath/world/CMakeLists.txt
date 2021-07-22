cmake_minimum_required (VERSION 2.8)

# 项目信息
project (world)

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

message(${PROJECT_NAME}---main_SOURCE_DIR_is_${main_SOURCE_DIR})
message(${PROJECT_NAME}---hello_SOURCE_DIR_is_${hello_SOURCE_DIR})
message(${PROJECT_NAME}---world_SOURCE_DIR_is_${world_SOURCE_DIR})
message(${PROJECT_NAME}---hello_world_SOURCE_DIR_is_${hello_world_SOURCE_DIR})

# 添加头文件路径,相当于添加 -I
# include_directories(${hello_world_SOURCE_DIR}/world)
add_library(${PROJECT_NAME} SHARED ${DIR_SRCS})


