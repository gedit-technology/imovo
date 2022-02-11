Imovo :: make releases :: documentation
=======================================

Not everything is automated yet.

Steps
-----

- Do the release commit in the product's repo.

- Call `imovo-product-build-all-deps.sh`,
  or manually replace `~/.imovo/<product>/` by `~/.imovo/_deps_<product>/`.

- Call `imovo-utils-setup-env.sh` to enter the environment for the product.

- Call the `make-release-<product>.sh` script.
  The script tells where the tarball is saved, if successful.

- Possibly copy the tarball inside `~/.imovo/_tarballs/`

- In the product's repo:
  - Push the commit;
  - Add the tag and push it;
  - Possibly do a post-release version bump.

- Possibly upload the tarball, or at least do a backup.

- Adapt the module's build script if it builds from a tarball.

- Re-build some products, as appropriate.
