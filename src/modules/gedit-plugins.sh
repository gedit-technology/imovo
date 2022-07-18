#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"

pushd ../utils/
./imovo-utils-build-module-standard-meson.sh "${product}" 'gedit-plugins' 'master' || exit 1
popd
