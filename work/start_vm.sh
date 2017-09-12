#!/bin/bash

echo
echo Preparing to start VM...
echo
echo

ln -s /vmlinuz
ln -s /initramfs
ln -s /os.img
ln -s lesson${1}.img scripts.img
if [ -e /project/target/prepare_vm.sh ]; then
    /project/target/prepare_vm.sh ${1}
fi

/start_vm.sh
