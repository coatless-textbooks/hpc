# Recipes for GDAL

Contained within are the modulefiles and [recipes](recipes/) for building GDAL.

Note: GDAL recipes have a hard dependency on [proj](../proj/). This dependency must
be specified by setting `--with-proj=` option during the configuration. 

For example, we have:

```bash
./configure --with-proj=$SOFTWARE_DIR_ROOT/proj/8.2.0/
```

For more details, please see: <https://github.com/OSGeo/gdal/issues/1352>
