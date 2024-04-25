#!/bin/bash

set -e

clean() {
    if [ -d .git ];then
        git clean -dxf
        git checkout .
    else
        rm -rf repo*
    fi
}

build() {
    test -f README.md && rm -rf README.md
    bash bin/checkurl.sh | tee -a README.md
}

history_commit() {
    g++ bin/history.cpp -o history -Wall -static -z now -Oz
    ./history
}

main() {
    build
}

main
