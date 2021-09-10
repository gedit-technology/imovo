#!/bin/sh

tarball_url='https://github.com/gedit-org/gtksourceview/releases/download/4.0.40/gtksourceview-4.0.40.tar.xz'
tarball_filename='gtksourceview-4.0.40.tar.xz'

../utils/imovo-utils-cache-tarball.sh "${tarball_filename}" "${tarball_url}"
../utils/imovo-utils-prepare-module-source-tarball.sh "${tarball_filename}"
