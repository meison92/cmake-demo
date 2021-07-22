#!/bin/bash

current_path=$(
cd $(dirname "${BASH_SOURCE[0]}")
pwd
)

echo current_path is $current_path

cd $current_path/world
gcc world.c -fPIC -shared -o libworld.so

echo =========================1=========================
cd $current_path/hello
# 1. have libhello.so find the libworld.so
gcc hello.c -fPIC -shared -o libhello.so -I../world -L../world -lworld
echo there is no LD_LIBRARY_PATH
ldd libhello.so

echo 
echo =========================2=========================
# 2. have libhello.so find the libworld.so
export LD_LIBRARY_PATH=$current_path/world
echo there is LD_LIBRARY_PATH $current_path/world
ldd libhello.so
echo runpath is $(patchelf --print-rpath libhello.so)

unset LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=
echo LD_LIBRARY_PATH is $LD_LIBRARY_PATH

echo 
echo =========================3=========================
cd $current_path/hello
gcc hello.c -shared -o libhello.so -I../world -L../world -lworld
cd $current_path
# 3. compile the exec file with rpath
echo gcc -o main main.c -I./hello -L./hello -lhello  -Wl,-rpath $current_path/world
gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath $current_path/hello
echo runpath is $(patchelf --print-rpath main)
ldd main
# readelf -d main
#run the main
./main

echo 
echo =========================4=========================
# 4. compile the exec file with rpath
cd $current_path/hello
gcc hello.c -fPIC -shared -o libhello.so -I../world -L../world -lworld
cd $current_path
echo gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath $current_path/hello -Wl,-rpath $current_path/world
gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath $current_path/hello -Wl,-rpath $current_path/world
echo runpath is $(patchelf --print-rpath main)
ldd main
#run the main
./main

echo 
echo =========================5=========================
# 5. compile the exec file with rpath-link
cd $current_path/hello
gcc hello.c -fPIC -shared -o libhello.so -I../world -L../world -lworld
cd $current_path
echo gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath $current_path/hello -Wl,-rpath-link $current_path/world
gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath $current_path/hello -Wl,-rpath-link $current_path/world
echo runpath is $(patchelf --print-rpath main)
ldd main
#run the main
./main

echo 
echo =========================6=========================
# 6. compile the exec file with rpath
cd $current_path/hello
gcc hello.c -fPIC -shared -o libhello.so -I../world -L../world -lworld -Wl,-rpath $current_path/world
cd $current_path
echo gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath $current_path/hello
gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath $current_path/hello
echo runpath is $(patchelf --print-rpath main)
ldd main
# readelf -d main
#run the main
./main

echo 
echo =========================7=========================
# 7. compile the exec file with rpath-link
cd $current_path/hello
gcc hello.c -fPIC -shared -o libhello.so -I../world -L../world -lworld -Wl,-rpath $current_path/world
cd $current_path
echo gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath-link $current_path/hello
gcc -o main main.c -I./hello -L./hello -lhello -Wl,-rpath-link $current_path/hello
echo runpath is $(patchelf --print-rpath main)
ldd main
#run the main
./main

echo 
echo =========================8=========================
# 8. test if the rpath can instead of the -L
cd $current_path/hello
gcc hello.c -fPIC -shared -o libhello.so -I../world -L../world -lworld -Wl,-rpath $current_path/world
cd $current_path
echo gcc -o main main.c -I./hello -Wl,-rpath $current_path/hello -lhello 
gcc -o main main.c -I./hello -Wl,-rpath $current_path/hello -lhello 
echo runpath is $(patchelf --print-rpath main)
ldd main
#run the main
./main
# 测试下来-rpath 不能替代-L
# 现代连接器在处理动态库时将
# 链接时路径（Link-time path）和
# 运行时路径（Run-time path）分开,
# 通过-L指定连接时库的路径，
# 通过-R（或-rpath）指定程序运行时库的路径，
# 大大提高了库应用的灵活性。