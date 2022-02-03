Imovo news
==========

News in v2022.1, 2022-02-xx (not yet released)
---------------------------

* Utils:
 - Doing a new pass at improving the shell scripts.
 - Especially the one to prepare the build of a module from a git repo (smarter
   way, to make it faster for the following builds, especially for big git
   repos). With git submodules handling too.
   The old/dumb script just did a full copy each time, now it's a local git
   clone/pull (basically).

* Modules additions:
 - autoconf-archive
 - gedit-plugins

* Modules: some improvements here and there; adapt for utils changes.
* Documentation improvements.

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
