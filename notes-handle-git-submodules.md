notes-handle-git-submodules
===========================

Some quick trials
-----------------

```
git pull
# The .gitmodules text file has correctly been updated.
# But not the submodules themselves. A bit a mess.
# There is maybe a git pull high-level option to update the submodules as well.

git res
git clean -xdf
# still not sufficient.

git submodule update --init
# still not sufficient.

==> Will read the manpages, instead of trying lots of commands.
```

Possibility to use old/dumb script
----------------------------------

Worst case, I can re-add and re-use the old and dumb utils script for git, which
does a full copy each time instead of doing git pull.

After reading the gitsubmodules(7) manpage
------------------------------------------

- There are high-level options to some git commands, to recurse into submodules.

- Maybe need to update/improve my readme files in some git repos for submodules
  handling.
