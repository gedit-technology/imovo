#!/bin/sh

pushd ../../utils/
source ./imovo-utils-setup-env.sh 'gnome-latex'
popd

pushd ../../modules/
./tepl.sh 'gnome-latex'
popd
