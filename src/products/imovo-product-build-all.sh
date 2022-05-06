#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product_directory="$1"

./imovo-product-build-deps.sh "${product_directory}" &&
./imovo-product-build-top.sh "${product_directory}"
