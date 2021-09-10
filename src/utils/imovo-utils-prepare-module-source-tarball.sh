#!/bin/sh

tarball_filename="$1"

tarballs_location=~/.imovo/_tarballs
imovo_tmp_prefix=~/.imovo/_tmp

rm -rf "${imovo_tmp_prefix}"
mkdir -p "${imovo_tmp_prefix}"

cp "${tarballs_location}/${tarball_filename}" "${imovo_tmp_prefix}/"

pushd "${imovo_tmp_prefix}/"
tar xf "${tarball_filename}"
popd
