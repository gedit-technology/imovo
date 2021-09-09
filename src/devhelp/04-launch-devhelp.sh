#!/bin/sh

install_prefix=~/.imovo/devhelp

# To find the libdevhelp*.so:
export LD_LIBRARY_PATH="${install_prefix}/lib64"

# To find the Devhelp's GSettings schemas (and it's probably useful for other
# things):
export XDG_DATA_DIRS="${install_prefix}/share:${XDG_DATA_DIRS}"

"${install_prefix}"/bin/devhelp "$@"
