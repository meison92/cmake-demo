cmake_minimum_required (VERSION 2.8)

# 项目信息
project (world)

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(./src DIR_SRCS)

include_directories(./inc)

# 添加头文件路径,相当于添加 -I
add_library(${PROJECT_NAME} SHARED ${DIR_SRCS})

