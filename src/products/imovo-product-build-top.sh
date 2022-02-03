#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product_directory="$1"

product_name="${product_directory%/}"

pushd ../utils/
source ./imovo-utils-setup-env.sh "${product_name}"
popd

pushd ../modules/
./${product_name}.sh "${product_name}" || exit 1
popd
