Imovo :: make releases :: documentation
=======================================

Not everything is automated yet.

Steps
-----

- Do the release commit in the product's repo, writing a summary of changes in
  the NEWS file, adapting the version number if appropriate, adding the
  `<release>` element in the AppData if it's an application, etc.

- Call `imovo-product-build-deps.sh`,
  or manually replace `~/.imovo/<product>/` by `~/.imovo/_deps_<product>/`.

- Call `imovo-shell` to enter the environment for the product.

- Run the usual commands to roll the tarball (`ninja dist` or `make distcheck`).

- Possibly copy the tarball inside `~/.imovo/_tarballs/`

- In the product's repo:
  - Push the commit;
  - Add the tag and push it;
  - Possibly do a post-release version bump.
  - If the release was done on a branch (for a stable version), it's better to
    copy the added content to the NEWS file into the one from the main/master
    branch. Although it's not the most important, and can be skipped.

- Possibly upload the tarball, or at least do a backup.

- Adapt the module's build script if it builds from a tarball.

- Re-build some products, as appropriate.
