# The prefix in which we want to install
PREFIX := /usr 
# Where to find pkgconfig
PKGCONFIG := /usr/bin/pkg-config
# Warnings! Obviously.
GUILE_WARNINGS = -Wunbound-variable -Warity-mismatch -Wformat
# Our install path
GUILE_INSTALL := $(shell $(PKGCONFIG) guile-2.0 --variable=pkgdatadir)/site


# You should not need to edit below this line.

GUILE_EXEC := $(shell $(PKGCONFIG) guile-2.0 --variable=exec_prefix)
GUILD := $(GUILE_EXEC)/bin/guild
