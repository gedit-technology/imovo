#!/bin/sh

install_prefix=~/.imovo/devhelp
export LD_LIBRARY_PATH="${install_prefix}/lib64"
"${install_prefix}"/bin/devhelp
