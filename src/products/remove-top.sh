#!/bin/sh

# Remove the top module from a product. I.e., keep only the deps.
#
# This script is meant to be copied in ~/.imovo/ and be called from that
# directory.

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"

if test '(' -d "${product}" ')' -a '(' -d "_deps_${product}" ')'
then
	rm -rf "${product}" || exit 1
	cp -r "_deps_${product}" "${product}" || exit 1
else
	echo -n "$0: '${product}' and '_deps_${product}' " 1>&2
	echo "must both exist and be directories." 1>&2
fi
