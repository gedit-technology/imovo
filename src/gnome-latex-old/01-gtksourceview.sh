#!/bin/sh

tarballs_cache_dir=~/.cache/imovo/tarballs
build_prefix='/tmp/imovo'
install_prefix=~/.imovo/gnome-latex
rm -rf "${install_prefix}"

tarball_filename='gtksourceview-4.0.40.tar.xz'
remote_tarball_url="https://github.com/swilmet-archives/gtksourceview/releases/download/4.0.40/${tarball_filename}"
tarball_path="${tarballs_cache_dir}/${tarball_filename}"

if test ! -f "${tarball_path}"
then
	mkdir -p "${tarballs_cache_dir}"
	curl --output "${tarball_path}" --location "${remote_tarball_url}" || exit 1
fi

rm -rf "${build_prefix}"
mkdir -p "${build_prefix}"
pushd "${build_prefix}"

cp "${tarball_path}" .
tar xf "${tarball_filename}"
pushd "gtksourceview-4.0.40/"

mkdir -p "${install_prefix}"
./configure --prefix="${install_prefix}" --enable-introspection=yes --enable-vala=yes || exit 1
make || exit 1
make check || exit 1 # before install
make install || exit 1
make check || exit 1 # after install

popd
popd
if PKG_CONFIG_PATH="${install_prefix}/lib64/pkgconfig" pkg-config --modversion gtksourceview-4
then
	echo OK
else
	echo KO
fi
