#!/bin/sh

pushd ../../utils/
source ./imovo-utils-setup-env.sh 'gnome-latex'
popd

pushd ../../modules/
./gnome-latex.sh 'gnome-latex'
popd
