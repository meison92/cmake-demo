cmake_minimum_required (VERSION 2.8)

# 项目信息
project (main)

# add_subdirectory(world)
add_subdirectory(hello)
add_subdirectory(hello_world)

message(${PROJECT_NAME}---main_SOURCE_DIR_is_${main_SOURCE_DIR})
message(${PROJECT_NAME}---hello_SOURCE_DIR_is_${hello_SOURCE_DIR})
message(${PROJECT_NAME}---world_SOURCE_DIR_is_${world_SOURCE_DIR})
message(${PROJECT_NAME}---hello_world_SOURCE_DIR_is_${hello_world_SOURCE_DIR})

get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
foreach(dir ${dirs})
  message(STATUS "main_dir='${dir}'")
endforeach()

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 添加头文件路径,相当于添加 -I
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/hello_world)
# 添加库文件路径,相当于添加 -L
# link_directories(${CMAKE_CURRENT_SOURCE_DIR}/hello_world)

get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
foreach(dir ${dirs})
  message(STATUS "main_dir='${dir}'")
endforeach()

# 如果我们使用了add_subdirectory(hello)，我们会带入libhello.so依赖的第三方库， 在链接时加入 -lworld
# 并且我们 link_directories 添加的库路径会添加进rpath.
# 方法1： 所以如果我们使用了 add_subdirectory(hello)，需要在./build/CMakeFiles/main.dir/link.txt 中删除 -l
# 方法2： 不使用add_subdirectory(hello)，在libhello.so中添加rpath，我已经放了hello/libhello.so
# 方法3： 在生成libhello.so的时候，加上PRIVATE关键字, target_link_libraries(${PROJECT_NAME} PRIVATE world)
# link_directories(${CMAKE_CURRENT_SOURCE_DIR}/world)

add_executable(main ${DIR_SRCS})
# 只要加上,会集成libhello_world的一些链接库,rpath.头文件包含路径
target_link_libraries (main hello_world)


