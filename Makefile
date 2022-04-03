SHELL := /bin/sh

PREFIX ?= /usr/local

.PHONY: all
all: man

mgitstatus.1: mgitstatus.1.md
	pandoc ./$< -s -t man > $@

.PHONY: man
man: mgitstatus.1

.PHONY: test
test:
	# SC1117 Backslash is literal in...
	# SC2059 Don't use variables in the printf format string. But we need to or colors won't work
	# SC2012 Use find instead of ls, but we need to extract the user id of the .git dir
	shellcheck -e SC1117,SC2059,SC2012 mgitstatus

.PHONY: install
install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -d $(DESTDIR)$(PREFIX)/man/man1
	install -m 755 mgitstatus $(DESTDIR)$(PREFIX)/bin/
	install mgitstatus.1 $(DESTDIR)$(PREFIX)/man/man1/
