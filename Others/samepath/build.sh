current_path=$(
cd $(dirname "${BASH_SOURCE[0]}")
pwd
)

cd $current_path

echo =========================1=========================
gcc world.c -fPIC -shared -o libworld.so

# 1. have libhello.so find the libworld.so
gcc hello.c -fPIC -shared -o libhello.so -I./ -L./ -lworld
echo there is no LD_LIBRARY_PATH
ldd libhello.so

echo 
echo =========================2=========================
# 2. have libhello.so find the libworld.so
export LD_LIBRARY_PATH=$(pwd)
echo there is LD_LIBRARY_PATH $(pwd)
ldd libhello.so
echo runpath is $(patchelf --print-rpath libhello.so)

unset LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=
echo LD_LIBRARY_PATH is $LD_LIBRARY_PATH

echo 
echo =========================3=========================
# 3. compile the exec file with rpath
gcc hello.c -shared -o libhello.so -I./ -L./ -lworld
echo gcc -o main main.c -I./ -L. -lhello  -Wl,-rpath $(pwd)
gcc -o main main.c -I./ -L. -lhello -Wl,-rpath $(pwd)
echo runpath is $(patchelf --print-rpath main)
ldd main
# readelf -d main
#run the main
./main

echo 
echo =========================4=========================
# 4. compile the exec file with rpath
gcc hello.c -fPIC -shared -o libhello.so -I./ -L./ -lworld -Wl,-rpath $(pwd)
echo gcc -o main main.c -I./ -L. -lhello  -Wl,-rpath $(pwd)
gcc -o main main.c -I./ -L. -lhello -Wl,-rpath $(pwd)
echo runpath is $(patchelf --print-rpath main)
ldd main
# readelf -d main
#run the main
./main

echo 
echo =========================5=========================
# 5. compile the exec file with rpath-link
gcc hello.c -fPIC -shared -o libhello.so -I./ -L./ -lworld -Wl,-rpath-link $(pwd)
echo gcc -o main main.c -I./ -L. -lhello  -Wl,-rpath-link $(pwd)
gcc -o main main.c -I./ -L. -lhello -Wl,-rpath-link $(pwd)
echo runpath is $(patchelf --print-rpath main)
ldd main
#run the main
./main