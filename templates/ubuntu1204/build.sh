#!/bin/sh

cd `dirname $0`

if [ -d "packer_output" ]; then
    rm -fr packer_output
fi

packer build template.json

qemu-img convert -c -f qcow2 -O qcow2 packer_output/ubuntu1204.qcow2 ubuntu1204_`date +%d-%m-%Y`.qcow2

rm -fr packer_output
