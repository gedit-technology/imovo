#!/usr/bin/env bash

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product_directory="$1"

product_name="${product_directory%/}"

pushd ../utils/
./imovo-utils-prepare-product.sh "${product_name}" || exit 1
source ./imovo-utils-setup-env.sh "${product_name}"
popd

pushd "${product_directory}" || exit 1
for dep in `cat list-deps`
do
	pushd ../../modules/
	./${dep}.sh "${product_name}" || exit 1
	popd
done
popd

pushd "${imovo_config_prefix}" || exit 1
cp -r "${product_name}/" "_deps_${product_name}"
popd
