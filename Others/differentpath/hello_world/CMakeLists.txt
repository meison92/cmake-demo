cmake_minimum_required (VERSION 2.8)

# 项目信息
project (hello_world)

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

message(${PROJECT_NAME}---main_SOURCE_DIR_is_${main_SOURCE_DIR})
message(${PROJECT_NAME}---hello_SOURCE_DIR_is_${hello_SOURCE_DIR})
message(${PROJECT_NAME}---world_SOURCE_DIR_is_${world_SOURCE_DIR})
message(${PROJECT_NAME}---hello_world_SOURCE_DIR_is_${hello_world_SOURCE_DIR})

# 结合FIND_PATH使用
# set(CMAKE_INCLUDE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/hello")
# FIND_PATH(myHeader hello.h)

# 结合FIND_LIBRARY使用
# set(CMAKE_LIBRARY_PATH "${CMAKE_CURRENT_SOURCE_DIR}/hello")
# FIND_LIBRARY(HELLO_LIBRARY libhello.so)
# 比如
# find_library(LIBSYSTEMD_LIBRARY
#     NAMES
#         systemd
#         libsystemd
#     HINTS
#         ${LIBSYSTEMD_ROOT_DIR}/lib
#         ${PC_LIBSYSTEMD_LIBDIR}
#         ${PC_LIBSYSTEMD_LIBRARY_DIRS}
#     )

# 指定链接库时,二级依赖的搜索目录
# set(CMAKE_BUILD_RPATH "\$ORIGIN:${main_SOURCE_DIR}/world")
# message(CMAKE_BUILD_RPATH_is_${CMAKE_BUILD_RPATH})

# 添加头文件路径,相当于添加 -I
add_library(${PROJECT_NAME} SHARED ${DIR_SRCS})
target_link_libraries(${PROJECT_NAME} hello)

#不能用 include_directories(${main_SOURCE_DIR}/hello),因为include_directories向下传递.
target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${main_SOURCE_DIR}/hello
)




