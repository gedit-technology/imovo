#!/bin/sh

remote_tarball_url='https://github.com/gedit-org/gtksourceview/releases/download/4.0.40/gtksourceview-4.0.40.tar.xz'
tarballs_cache_dir=~/.cache/imovo/tarballs
tarball_path="${tarballs_cache_dir}/gtksourceview-4.0.40.tar.xz"

if test ! -f "${tarball_path}"
then
	mkdir -p "${tarballs_cache_dir}"
	curl --output "${tarball_path}" --location "${remote_tarball_url}"
fi
