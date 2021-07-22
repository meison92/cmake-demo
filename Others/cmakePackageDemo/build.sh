#!/bin/bash

current_path=$(
cd $(dirname "${BASH_SOURCE[0]}")
pwd
)

cd $current_path

if [ $1 == --clean -o $1 == clean ];then
    echo clean the build dir
    cd $current_path/mylib
    rm build -rf
    rm install -rf
    cd $current_path/myapp
    rm build -rf
    exit 0
fi

cd $current_path/mylib
mkdir build
cd build
cmake ../
# make install

# cd $current_path/myapp
# mkdir build
# cd build
# cmake ../
# make
# ./myapp


