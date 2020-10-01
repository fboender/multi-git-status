MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/sh

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
		shellcheck -e SC1117,SC2059 mgitstatus
