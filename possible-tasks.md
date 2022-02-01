Imovo :: possible tasks
=======================

- In `products/`, have an `imovo-product-build-everything.sh` script to build a
  whole (but single) product.

- In `products/`, create an `integration` product to build all libs and apps in
  the same prefix.

- Add `autoconf-archive` module. Install it from a tarball (will most probably
  be easier), there is the `./configure` script, while in the git repo it's
  missing (like normal Autotools projects).

- Have an easier / less hacky / more generic way to launch installed programs.
