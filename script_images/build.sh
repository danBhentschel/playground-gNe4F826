#!/bin/bash

set -x

if [ "$EUID" -ne 0 ]
  then echo "Must be run as root"
  exit
fi


mk_image() {
    mkdir tmp
    cp lesson${1}.sh tmp/lesson.sh
    if compgen -G "lesson${1}_*.sh" > /dev/null; then
        cp lesson${1}_*.sh tmp
    fi
    rm -f ../work/lesson${1}.img
    ./make_image.sh ../work/lesson${1}.img tmp/*
    rm -rf tmp
}

mk_image 1
