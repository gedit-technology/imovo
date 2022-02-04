Imovo :: products :: documentation
==================================

Thanks to the consistency of calling a module build script, a product can be
described declaratively with a list of modules (the modules are built in the
same order as the list, sequentially, so not in parallel). There are generic
scripts to build a product.

Only a *single* product can be built at a time. It's sequential. That way the
implementation is much easier, and for my needs it's sufficient.
