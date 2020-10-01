MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/sh

.PHONY: all
all: man

mgitstatus.1: mgitstatus.1.md
		pandoc ./$< -s -t man > $@

.PHONY: man
man: mgitstatus.1
