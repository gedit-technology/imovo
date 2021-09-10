#!/bin/sh

name="$1"

source ./imovo-utils-global-imovo-config.sh

install_prefix="${imovo_config_prefix}/${name}"
rm -rf "${install_prefix}"
mkdir -p "${install_prefix}"
