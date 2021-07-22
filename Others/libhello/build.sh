#!/bin/bash

current_path=$(
cd $(dirname "${BASH_SOURCE[0]}")
pwd
)

cd "$current_path" || exit
gcc hello.c -fPIC -shared -o libhello.so