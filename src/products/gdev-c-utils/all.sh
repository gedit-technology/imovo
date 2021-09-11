#!/bin/sh

./01-prepa.sh || exit 1
./02-gtksourceview.sh || exit 1
./03-amtk.sh || exit 1
./04-tepl.sh || exit 1
#./05-gdev-c-utils.sh || exit 1
