# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
aux_source_directory(. DIR_LIB_SRCS)

# 指定生成 MathFunctions 链接库
add_library (MathFunctions5 ${DIR_LIB_SRCS})

# 指定 MathFunctions 库的安装路径
install (TARGETS MathFunctions5 DESTINATION lib)
install (FILES MathFunctions.h DESTINATION include)

# 指定 MathFunctions 库的安装路径
# SET(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install)
# install(TARGETS MathFunctions5
#     EXPORT mymathlib-targets
#     LIBRARY DESTINATION lib)

# install(EXPORT mymathlib-targets
#     NAMESPACE myhellolib::
#     FILE MathFunctions.h DESTINATION include
#     FILE mymathlib-config.cmake DESTINATION lib/cmake/mymathlib)
