# Creating Modulefiles

## Sample module file

```bash
#%Module1.0####################################################################

proc ModulesHelp { } {
	global _module_name

	puts stderr "The $_module_name modulefile defines the default system paths and"
	puts stderr "environment variables needed to use the $_module_name libraries and tools."
	puts stderr ""
}

set _module_name	[module-info name]

## Change to be user-specifc path
set approot /projects/stat/shared/$::env(USER)/software/libevent/2.1.11

module-whatis "       Name: libevent"
module-whatis "  Long name: libevent - An event notification library"
module-whatis "    Version: 2.1.11"
module-whatis "   Category: library"
module-whatis "Description: An event notification library"
module-whatis "        URL: https://libevent.org/"
module-whatis ""

if { [ is-loaded gcc/7.2.0 ] } {} else { module load gcc/7.2.0 }

prepend-path	PATH	    $approot
prepend-path	LD_LIBRARY_PATH	    $approot/lib
prepend-path	LD_RUN_PATH	        $approot/lib
prepend-path	MANPATH	        $approot/man
prepend-path --delim " " LDFLAGS "-L $approot/lib"
prepend-path --delim " " CPPFLAGS "-I $approot/include"
prepend-path --delim " " CFLAGS "-I $approot/include"
```

- `prepend-path` by itself is for variables like `PATH` `LD_LIBRARY_PATH`, `LD_RUN_PATH`, `LIBRARY_PATH`, `CPATH`, `MANPATH` ...
- `prepend-path --delim " "` is for compiler flag variables like `LDFLAGS`, `CPPFLAGS`, `CFLAGS`, ...
-  Module dependencies should be specified with:

```tcl
## Load module if not already loaded.
if { [ is-loaded <module> ] } {} else { module load <module> }
```

- `conflict <module>` emphasizes any modules that can't be loaded together

# Self-notes

- `$::env()` is part of TCL language and allows the TCL script/modulefile to access variables found in the `env array`.
  - `$::env(HOME)` would return: /home/$USER
  - `$::env(USER)` would return: $USER
  - Details: https://wiki.tcl-lang.org/page/env


Useful references:

<https://cea-hpc.github.io/modules/docs/MC2_whitney_paper.pdf>
<https://www.acrc.bris.ac.uk/acrc/pdf/customising-environment-variables.pdf>
