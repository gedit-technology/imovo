#!/bin/sh

filename="$1"
url="$2"

tarballs_location=~/.imovo/_tarballs

tarball_path="${tarballs_location}/${filename}"

if test ! -f "${tarball_path}"
then
	mkdir -p "${tarballs_location}"
	curl --output "${tarball_path}" --location "${url}"
fi
