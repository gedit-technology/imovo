#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product_directory="$1"

pushd "${product_directory}" || exit 1
product_name="`cat product-name`"
popd

pushd ../utils/
./imovo-utils-prepare-product.sh "${product_name}" || exit 1
popd
