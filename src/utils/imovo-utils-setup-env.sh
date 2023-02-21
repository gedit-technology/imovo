#!/usr/bin/env bash

# Meant to be called with 'source':
# source ./imovo-utils-setup-env.sh <product_name>

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

_product="$1"

source ./imovo-utils-global-imovo-config.sh

# export this variable, needed in subshells with imovo-shell.
export _install_prefix="${imovo_config_prefix}/${_product}"

# share/pkgconfig is needed for gtk-doc.
export PKG_CONFIG_PATH="${_install_prefix}/lib64/pkgconfig:${_install_prefix}/share/pkgconfig"

export XDG_DATA_DIRS="${_install_prefix}/share:${XDG_DATA_DIRS}"
export LD_LIBRARY_PATH="${_install_prefix}/lib64"
export PATH="${_install_prefix}/bin:${PATH}"
export ACLOCAL_PATH="${_install_prefix}/share/aclocal/"
export GI_TYPELIB_PATH="${_install_prefix}/lib64/girepository-1.0"

# For customizing the prompt.
export IMOVO_UNDER_PRODUCT="${_product}"
export PS1="[${_product}] ${PS1}"

# "aliases" but implemented as functions and then exporting those functions so
# that they are available in subshells. (an alias is not exported and cannot be
# so).
cmake_imovo() {
	cmake -DCMAKE_INSTALL_PREFIX="${_install_prefix}" "$@"
}
meson_imovo() {
	meson --prefix "${_install_prefix}" "$@"
}
meson_gedit() {
	meson --prefix "${_install_prefix}" -D require_all_tests=true -D user_documentation=false "$@"
}
autogen_gnome_latex() {
	./autogen.sh --prefix="${_install_prefix}" --enable-introspection=yes --enable-code-coverage --enable-gtk-doc
}
autogen_gspell() {
	./autogen.sh --prefix="${_install_prefix}" --enable-introspection=yes --enable-vala=yes --enable-code-coverage --enable-gtk-doc --enable-installed-tests
}
autogen_tepl_gsv() {
	./autogen.sh --prefix="${_install_prefix}" --enable-introspection=yes --enable-code-coverage --enable-gtk-doc --enable-installed-tests
}
export -f cmake_imovo
export -f meson_imovo
export -f meson_gedit
export -f autogen_gnome_latex
export -f autogen_gspell
export -f autogen_tepl_gsv

alias make_no_deprecations="make -j`nproc` CFLAGS='-Wno-deprecated-declarations'"
