#!/bin/sh

tarball_filename='gtksourceview-4.0.40.tar.xz'
remote_tarball_url="https://github.com/gedit-org/gtksourceview/releases/download/4.0.40/${tarball_filename}"
tarballs_cache_dir=~/.cache/imovo/tarballs
tarball_path="${tarballs_cache_dir}/${tarball_filename}"

if test ! -f "${tarball_path}"
then
	mkdir -p "${tarballs_cache_dir}"
	curl --output "${tarball_path}" --location "${remote_tarball_url}" || exit 1
fi

build_prefix='/tmp/imovo'
rm -rf "${build_prefix}"
mkdir -p "${build_prefix}"

pushd "${build_prefix}"
cp "${tarball_path}" .
tar xf "${tarball_filename}"
pushd "gtksourceview-4.0.40/"
