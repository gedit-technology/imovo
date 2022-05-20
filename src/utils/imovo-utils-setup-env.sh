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
_install_prefix="${imovo_config_prefix}/${_product}"

# share/pkgconfig is needed for gtk-doc.
export PKG_CONFIG_PATH="${_install_prefix}/lib64/pkgconfig:${_install_prefix}/share/pkgconfig"

export XDG_DATA_DIRS="${_install_prefix}/share:${XDG_DATA_DIRS}"
export LD_LIBRARY_PATH="${_install_prefix}/lib64"
export PATH="${_install_prefix}/bin:${PATH}"
export ACLOCAL_PATH="${_install_prefix}/share/aclocal/"
export PS1="[${_product}] ${PS1}"

alias meson_imovo='meson --prefix "${_install_prefix}"'
alias autogen_gnome_latex='./autogen.sh --prefix="${_install_prefix}" --enable-introspection=yes --enable-vala=yes --enable-code-coverage --enable-gtk-doc'
alias autogen_gspell='./autogen.sh --prefix="${_install_prefix}" --enable-introspection=yes --enable-vala=yes --enable-code-coverage --enable-gtk-doc --enable-installed-tests'
alias autogen_gtksourceview='./autogen.sh --prefix="${_install_prefix}" --enable-introspection=yes --enable-code-coverage --enable-gtk-doc --enable-installed-tests'
alias make_no_deprecations="make -j`nproc` CFLAGS='-Wno-deprecated-declarations'"
