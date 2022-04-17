#!/usr/bin/env bash

# This module copies the GTK-Doc books from the system to the Imovo product
# install directory.
# We suppose that this module is executed first.
# If there are books duplicates from a following built module, the module built
# with Imovo will anyway override the previously copied system book. It's not a
# big problem if there are leftover files from the system book that aren't used
# by the newly installed book.

# It's useful because the gtk-doc fixxref tool will - as much as possible - not
# hard-code links to "/usr/share/gtk-doc/html/..." (for symbols part of another
# book), and put either "../" relative links, or - when running
# `make distcheck` - put "https://developer.gnome.org/" links which are
# specially handled by Devhelp (but are unfortunately no longer available
# online). So for Autotools tarballs, it's useful if Linux distros don't rebuild
# themselves the gtk-doc books and take the ones directly from the tarballs.

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
