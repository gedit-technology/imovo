#!/usr/bin/env bash

# This module copies the GTK-Doc books from the system to the Imovo product
# install directory.
# We suppose that this module is executed first.
# If there are books duplicates from a following built module, the module built
# with Imovo will anyway override the previously copied system book.

# It's useful because the gtk-doc fixxref tool will put "../" relative links for
# symbols part of another book. Instead of hard-coding a link to
# "/usr/share/gtk-doc/html/...".
# When releasing an Autotools tarball, the relative links are especially useful,
# if Linux distros don't rebuild themselves the gtk-doc books and take the ones
# directly from the tarballs.

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"

source ../utils/imovo-utils-global-imovo-config.sh

books_src_dir="/usr/share/gtk-doc/html"
books_dest_dir="${imovo_config_prefix}/${product}/share/gtk-doc/html"

mkdir -p "${books_dest_dir}"

pushd "${books_src_dir}" || exit 0

# Avoid getting "*" if the directory is empty.
shopt -s nullglob

for book in *
do
	# WARNING: here we suppose that the priority comes to the book of the
	# *system*, not a book already built with Imovo. See the note above.
	rm -rf "${books_dest_dir}/${book}"
	cp -r "${book}" "${books_dest_dir}/"
done
popd
