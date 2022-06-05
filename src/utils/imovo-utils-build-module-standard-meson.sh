#!/bin/sh

if test $# -ne 3
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

./imovo-utils-build-module-meson-with-args.sh "$1" "$2" "$3" ''
