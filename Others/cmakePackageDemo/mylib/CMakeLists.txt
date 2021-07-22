cmake_minimum_required(VERSION 2.8)
add_library(mylib mylib.c include/mylib.h)
SET(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install)
target_include_directories(mylib PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>)
set_target_properties(mylib PROPERTIES PUBLIC_HEADER "include/mylib.h")

# DESTINATION选项指定了一个文件会安装到磁盘的哪个路径下。若果给出的是全路径（以反斜杠或者驱动器名开头），它会被直接使用。
# 如果给出的是相对路径，它会被解释为相对于CMAKE_INSTALL_PREFIX的值的相对路径。
# EXPORT选项将已经安装的目标文件和一个名为<export-name>的导出文件关联起来。
# 它必须出现在所有RUNTIME，LIBRARY或者ARCHIVE选项之前。为了实际安装导出文件本身 (export file)，调用install(EXPORT)。参见下述install命令EXPORT版本的文档获取更多的细节。
install(TARGETS mylib
    EXPORT mylib-targets
    PUBLIC_HEADER DESTINATION include
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin)

install(
    EXPORT mylib-targets
    NAMESPACE myhellolib::
    FILE mylib-config.cmake DESTINATION lib/cmake/mylib)


# https://www.cnblogs.com/coderfenghc/archive/2012/08/12/2627561.html

# install(TARGETS targets... 
        # [EXPORT <export-name>]
#       [[ARCHIVE|LIBRARY|RUNTIME|FRAMEWORK|BUNDLE|
#       PRIVATE_HEADER|PUBLIC_HEADER|RESOURCE]

#        [DESTINATION <dir>]
#        [PERMISSIONS permissions...]
#        [CONFIGURATIONS [Debug|Release|...]]
#        [COMPONENT <component>]
#        [OPTIONAL] [NAMELINK_ONLY|NAMELINK_SKIP]
#       ] [...])