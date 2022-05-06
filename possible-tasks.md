Imovo :: possible tasks
=======================

- In `products/`, create an `integration` product to build all libs and programs
  in the same prefix.

- Have an easier / less hacky / more generic way to launch installed programs.

- In `products/`, add optional `top` files if the top of the product (so without
  counting the deps) is comprised of several modules (like gedit +
  gedit-plugins).
  Factor out an `imovo-product-build-util.sh` script.
