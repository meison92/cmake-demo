cmake_minimum_required (VERSION 2.8)

# 项目信息
project (hello)

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

message(${PROJECT_NAME}---main_SOURCE_DIR_is_${main_SOURCE_DIR})
message(${PROJECT_NAME}---hello_SOURCE_DIR_is_${hello_SOURCE_DIR})
message(${PROJECT_NAME}---world_SOURCE_DIR_is_${world_SOURCE_DIR})
message(${PROJECT_NAME}---hello_world_SOURCE_DIR_is_${hello_world_SOURCE_DIR})

set(CMAKE_BUILD_RPATH "\$ORIGIN:${main_SOURCE_DIR}/world")

add_library(${PROJECT_NAME} SHARED ${DIR_SRCS})




# 添加库文件路径,相当于添加 -L, 放在add_***前面
# link_directories(${main_SOURCE_DIR}/world)
# 使用INTERFACE的时候,并不会加上-L ./differentpath/world, 只会在main中使用-L ./differentpath/world
target_link_directories(${PROJECT_NAME}
    INTERFACE
        ${main_SOURCE_DIR}/world
)

# 添加链接库,相当于添加 -l, 放在add***之前
# link_libraries(libworld.so)
# 使用INTERFACE的时候,并不会加上-lworld, 只会在main中使用-lworld
target_link_libraries(${PROJECT_NAME}
    INTERFACE
        world
)

# 添加头文件路径,相当于添加 -I, 放在add***之前
# include_directories(${main_SOURCE_DIR}/world)
# get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
# foreach(dir ${dirs})
#   message(STATUS "hello_dir='${dir}'")
# endforeach()

# 使用INTERFACE的时候,并不会加上-I ./differentpath/world, 只会在main中使用-I ./differentpath/world
# 如果使用PUBLIC
# build/CMakeFiles/main.dir/flags.make
# C_INCLUDES = -I./differentpath/hello
#  -I./differentpath/world
target_include_directories(${PROJECT_NAME}
    INTERFACE
        ${main_SOURCE_DIR}/world
)