#!/bin/sh

pushd ../../utils/
source ./imovo-utils-setup-env.sh 'gdev-c-utils'
popd

pushd ../../modules/
./tepl.sh 'gdev-c-utils'
popd
