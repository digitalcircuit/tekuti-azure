# The prefix in which we want to install
PREFIX := /usr/local
# Where to find pkgconfig
PKGCONFIG := /usr/bin/pkg-config
# Warnings! Obviously.
GUILE_WARNINGS = -Wunbound-variable -Warity-mismatch -Wformat

# You should not need to edit below this line.

# For the tekuti shell script
INSTALL_BIN := $(PREFIX)/bin
# For our compiles Scheme files
INSTALL_SITE := $(shell $(PKGCONFIG) guile-2.0 --define-variable=prefix=$(PREFIX) --variable=sitedir)
# Path where Guile executables are installed
GUILE_EXEC := $(shell $(PKGCONFIG) guile-2.0 --variable=exec_prefix)
# The Guild build tool
GUILD := $(GUILE_EXEC)/bin/guild
