Imovo :: make releases :: documentation
=======================================

Not everything is automated yet.

Steps
-----

1. Do the release commit in the product's repo, writing a summary of changes in
   the NEWS file, adapting the version number if appropriate, adding the
   `<release>` element in the AppData if it's an application, etc.

2. Call `imovo-product-build-deps.sh`, or `remove-top.sh` or use the "i"
   product.

3. Call `imovo-shell` to enter the environment for the product, or the "i"
   product.

4. Run the usual commands to roll the tarball (`ninja dist` or
   `make distcheck`) and then copy the tarball in this directory.

5. In the product's repo:
  - Push the commit.
  - Add the tag and push it.
  - Possibly do a post-release version bump.
  - (Less important, can be ignored) If the release was done on a stable branch,
    copy the NEWS excerpt from the stable branch to main/master. When does it
    make sense?
    Here are the chronological events:
      - a stable branch is created.
      - main/master continues its course.
      - the next release to do between main/master and the stable branch needs
        to occur on the stable branch.
      - so after doing the release, if you diff the NEWS file between the stable
        branch and main/master, only the new excerpt is added on top.
      - so in that case it's better to copy that new excerpt into the
        main/master NEWS file, in order for master.gnome.org to correctly
        extract the news for the *next* version released on main/master.
        This also reduces the news content that you need to write for that next
        version, to not duplicate what's written below.

6. Possibly upload the tarball, or at least do a backup.

7. Re-build some products, as appropriate.
