Imovo news
==========

News in v2022.2, 2022-04-15
---------------------------

* Improvements to imovo-utils-setup-env.sh.
* Add launch.sh for gedit-plugins product.
* Add the first make-releases scripts.
* Add gspell module and product.
* Add tepl-untitled-document module, to build a specific branch of Tepl for
  gedit purposes.
* Other small changes/improvements here and there.

News in v2022.1, 2022-02-07
---------------------------

* Utils:
 - Doing a new pass at improving the shell scripts.
 - Especially the script to prepare the build of a module from a git repo
   (smarter way, to make it faster for the following builds, especially for big
   git repos). With git submodules handling too.
   The old/dumb script just did a full copy each time, now it's a local git
   clone/pull (basically).
 - setup-env: setup ACLOCAL_PATH (for Autotools projects).
* Modules: some improvements here and there; adapt for utils changes.
* Products:
 - Some improvements here and there.
 - Remove the product-name files, take the info from the directory name.
 - build-all-deps: fix a bug.
* More documentation.

* Modules additions:
 - autoconf-archive
 - gedit-plugins

* Products changes:
 - gedit -> gedit-plugins, to have everything.
 - Add tepl.

News in v2021, 2021-11-19
-------------------------

* End-of-2021 version.
* Mini-JHBuild replacement, but Imovo is more procedural, implemented mainly
  with small shell scripts and a few declarative files.
* Being able to build the following programs, including some of their libs:
 - devhelp
 - gdev-c-utils
 - gedit
 - gnome-latex
* Being able to develop these modules, but it's still a little quirky.
