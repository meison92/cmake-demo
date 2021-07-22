# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.8)

# 项目信息
project (hello)

#set (CMAKE_INCLUDE_CURRENT_DIR ON)

message(PROJECT_BINARY_DIR_is_${PROJECT_BINARY_DIR})
message(PROJECT_SOURCE_DIR_is_${PROJECT_SOURCE_DIR})
message(CMAKE_BINARY_DIR_is_${CMAKE_BINARY_DIR})
message(CMAKE_SOURCE_DIR_is_${CMAKE_SOURCE_DIR})

aux_source_directory(./src DIR_SRCS)
message(DIR_SRCS_is_${DIR_SRCS})

include_directories(${main_SOURCE_DIR}/common/inc)
include_directories(${main_SOURCE_DIR}/hello/inc)
include_directories(${main_SOURCE_DIR}/world/inc)

# set(CMAKE_BUILD_RPATH "\$ORIGIN:${main_SOURCE_DIR}/world")

# CMake中rpath的使用
# 默认情况下，这个PATH在构建产生的中间文件，是不增加的；而是只对安装的目标有效。如果你想针对构建的中间文件也有效果，可以加上
# set(CMAKE_SKIP_BUILD_RPATH FALSE)                 # 编译时加上RPATH
# set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)         # 编译时RPATH不使用安装的RPATH
# set(CMAKE_INSTALL_RPATH "")                       # 安装RPATH为空
# set(CMAKE_INSTALL_RPATH_USE_LINK_PATH FALSE)      # 安装的执行文件不加上RPATH

# 两条命令：
# 手动指定添加的RPATH
# SET(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE) 
# SET(CMAKE_INSTALL_RPATH "\${ORIGIN}/../lib")

# $ORIGIN https://www.technovelty.org/linux/exploring-origin.html

add_library(${PROJECT_NAME} SHARED ${DIR_SRCS})

# 编译动态库的时候，不需要调用的接口有实现
target_link_libraries(${PROJECT_NAME}
    INTERFACE
        world
)
